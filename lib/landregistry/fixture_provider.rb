require 'open-uri'
require 'memoist'

module LandRegistry
  class FixtureProvider
    extend Memoist

    def initialize()
      config_file = File.join(File.dirname(__FILE__), "../..", 'config', "fixtures-lookup.txt")
      @lookup = Hash[*File.read(config_file).split(/[, \n]+/)]
    end

    def get(name)
      resource = @lookup[name]
      if not resource.start_with?('http')
        resource = File.join(File.dirname(__FILE__), "../..", resource)
      end
      open(resource) {|f| f.read }
    end

    memoize :get
  end
end
