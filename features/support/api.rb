require 'httparty'
require 'json'

# any prerequisites to use the APIs below, e.g.
# creating API key, creating account, etc

require 'landregistry/http_client'

#$accept_header = 'application/vnd.api+json;revision=0.1'
$accept_header = 'application/json'
$httpbasicauth_username = ENV['HTTPBASICAUTH_USERNAME']
$httpbasicauth_password = ENV['HTTPBASICAUTH_PASSWORD']
$client = LandRegistry::HttpClient.new($httpbasicauth_username, $httpbasicauth_password, $accept_header)
