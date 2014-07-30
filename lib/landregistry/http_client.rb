require 'json-schema'

module LandRegistry
  class HttpClient
    attr_reader :root_url, :username, :password, :responses, :hydrate_tokens
    attr_writer :running

    def initialize(username, password, accept_header)
      @username = username
      @password = password
      @accept_header = accept_header

      @responses = []
      @hydrate_tokens = {}
    end

    def log_trace(method, url, request, response)
      # TODO trace log
    end

    def post(app_url, endpoint, body, env={})
      body = JSON.parse(body) if body.is_a? String
      options = {
        headers: {
          'Accept' => @accept_header,
          'Content-Type' => "application/json",
        },
        body: JSON.dump(body),
        basic_auth: {
          username: @username,
          password: @password,
        }
      }

      url = expand_url(app_url, endpoint, env)

      response = HTTParty.post(url, options)
      @responses << response
      log_trace('POST', url, body, last_body) if last_code < 400
      response
    end

    def expand_url(app_url, endpoint, env)
      require 'uri_template'
      template = "#{app_url}#{endpoint}".gsub(/{(.*?)}/) do
        "{#{$1.gsub(".", "_")}}"
      end
      $logger.debug("expanding: #{template} with env: #{env}")
      template = URITemplate.new(template)
      url = template.expand(env)
      $logger.debug("expanded: #{url}")
      url
    end

    def put(app_url, endpoint, body, env={})
      body = JSON.parse(body) if body.is_a? String
      options = {
        headers: {
          'Accept' => @accept_header,
          'Content-Type' => "application/json",
        },
        body: JSON.dump(body),
        basic_auth: {
          username: @username,
          password: @password,
        }
      }

      url = expand_url(app_url, endpoint, env)

      response = HTTParty.put(url, options)
      @responses << response
      log_trace('PUT', url, body, last_body) if last_code < 400
      response
    end

    def patch(app_url, endpoint, body, env={})
      body = JSON.parse(body) if body.is_a? String
      options = {
        headers: {
          'Accept' => @accept_header,
          'Content-Type' => "application/json",
        },
        body: JSON.dump(body),
        basic_auth: {
          username: @username,
          password: @password,
        }
      }


      url = expand_url(app_url, endpoint, env)

      response = HTTParty.patch(url, options)
      @responses << response
      log_trace('PATCH', url, body, last_body) if last_code < 400
      response
    end

    def get(app_url, endpoint, body=nil, env={})
      _verb 'GET', app_url, endpoint, env
    end

    def delete(app_url, endpoint, body=nil, env={})
      _verb 'DELETE', app_url, endpoint
    end

    def add_response(response)
      @responses << response
    end

    def _verb(verb, app_url, endpoint, env={}, body=nil)
      options = {
        headers: {
          'Accept' => @accept_header,
          'Content-Type' => "application/json",
        },
        body: JSON.dump(body),
        basic_auth: {
          username: @username,
          password: @password,
        }
      }

      url = expand_url(app_url, endpoint, env)

      response = HTTParty.send(verb.downcase, url, options)
      @responses << response
      log_trace(verb, url, body, last_body) if last_code < 400
      response
    end

    def last_code
      @responses.last.code
    end

    def last_body
      if @responses.last.body
        JSON.parse(@responses.last.body)
      end
    end

    def get_link(keys)
      @responses.reverse.each do |response|
        body = JSON.parse(response.body)
        if body and body['links'] and body['links'][keys]
          key = body['links'][keys]
          kk = key.gsub(/\{(\w+)\.(\w+)\}/) do |match|
            a = match[1...-1].split('.')
            body[a[0]][0][a[1]] or body[a[0]][0]['links'][a[1]]
          end
          return kk
        end
      end
      '/what_are_you_looking_for?'
    end

    def hydrater(what)
      @hydrate_tokens.each_pair do |key, value|
        if key.class == Symbol
          key = ":#{key}"
        end
        what = what.gsub(key, value)
      end
      what
    end

    def add_hydrate(key, value)
      @hydrate_tokens[key] = value
    end

    # support for 'fixtures' in suite root
    def validate(against)
      file_name = File.join(File.dirname(__FILE__), "../..", 'fixtures', "#{against}.json")
      if File.exists?(file_name) and not against.is_a? Hash
        JSON::Validator.validate!(file_name, last_body)
      else
        JSON::Validator.validate!(against, last_body)
      end
    end

    def [](name)
      # either access some type by name, or access a field on an object if there was only one
      if last_body.has_key? name
        last_body[name][0]
      else
        last_body.select { |x| x != 'links' and x != 'meta' }.values.first.first[name]
      end
    end
  end
end
