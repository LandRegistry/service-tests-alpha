require 'capybara/cucumber'
require 'capybara/poltergeist'
require 'selenium-webdriver'

include Capybara::DSL

Capybara.default_selector = :xpath
Capybara.default_driver = :poltergeist
Capybara.javascript_driver = :poltergeist
Capybara.default_wait_time = 10
Capybara.app_host = 'http://ignored:4567'

Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(app, :inspector => true)
end
