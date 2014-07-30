require 'erb'

When(/^I (\w+) to (\/\S*?)$/) do |verb, url|
  $logger.debug("Making request to #{url}")
  $logger.debug("hydrated: #{@client.hydrater(url)}")
  @client.send(verb.downcase, @app, @client.hydrater(url), env)
end

When(/^I (\w+) to (\/\S*?) with the body:$/) do |verb, url, body|
  $logger.debug("Making request to #{url}")
  $logger.debug("hydrated: #{@client.hydrater(url)}")
  body = @client.hydrater body
  $logger.debug("body: #{body}")
  @client.send(verb.downcase, @app, @client.hydrater(url), body, env)
end

When(/^I make a (\w+) request to (\/\S*?)$/) do |verb, url|
  step "I #{verb} to #{url}"
end

When(/^I make a (\w+) request to (\/\S*?) with the body:$/) do |verb, url, body|
  step "I #{verb} to #{url} with the body:", body
end

def env
  {
    # "foo_id" => @foo_id,
  }
end


When(/^I make a (\w+) request to the href "(.*?)"$/) do |verb, keys|
  link = @client[keys] || @client.inject(keys)
  @client.send(verb.downcase, @app, link, {}, env)
end

When(/^I make a (\w+) request to the href "(.*?)" with the body:$/) do |verb, keys, body|
  body = @client.hydrater(body)
  link = @client[keys] || @client.inject(keys)
  @client.send(verb.downcase, @app, link, body, env)
end

When(/^I make a (\w+) request to the link "(.*?)" of that (\w+)$/) do |verb, keys, resource|
  id = instance_variable_get("@#{resource}_id")
  @client.get("/resources/#{id}")
  step %Q{I make a #{verb} request to the link "#{keys}"}
end

When(/^I fetch the (.*+)$/) do |resource|
  resource = resource.gsub(/\s/, "_")
  id = instance_variable_get("@#{resource}_id")
  @client.get("/resources/#{id}")
end

When(/^I GET "(.*?)" from the previous response$/) do |keys|
  @client.get(@client.inject keys)
end

require 'json-schema'
Then(/^the response has this schema:$/) do |schema|
  @client.validate(schema)
end

Then(/^the response is valid according to the "(.*?)" schema$/) do |filename|
  @client.validate(filename)
end

Then(/^I should get a (.+) status code$/) do |code|
  message = @client.last_body["status"] rescue ""
  assert_equal code.to_i, @client.last_code, message
end

Then(/^there should be no response body$/) do
  assert_nil @client.last_body
end

def checker(from, of, nesting)
  assert_not_nil from, nesting

  from.each_pair do |key, val|
    if val.is_a?(String) || val.is_a?(Integer) || val.is_a?(TrueClass) || val.is_a?(FalseClass)
      assert_equal val, of[key], "#{nesting}>#{key}"
    elsif val.nil?
      assert_nil of[key]
    else
      checker val, of[key], "#{nesting}>#{key}"
    end
  end
end

Then(/^the fields on this (.*) match:$/) do |resource, against|
  checker JSON.parse(@client.hydrater(against)), @client["#{resource}s"], ''
  assert_equal @client.last_body["#{resource}s"].size, 1
end

Then(/^the fields on these (.*) match:$/) do |resource, against|
  against = JSON.parse(@client.hydrater(against))
  @client.last_body[resource].each do |body|
    checker against, body, ''
  end
end

Then(/^there should be more than two (.*) paged$/) do |name|
  assert @client.last_body[name].size >= 2, "There were not more than two #{name}"
end

Before do |scenario|
  @client = LandRegistry::HttpClient.new($httpbasicauth_username, $httpbasicauth_password, $accept_header)
  @client.running = scenario
end
