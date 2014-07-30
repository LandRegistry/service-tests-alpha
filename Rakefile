require 'cucumber'
require 'cucumber/rake/task'


namespace :features do

  Cucumber::Rake::Task.new(:local) do |t|
    t.profile = "local"
  end

  Cucumber::Rake::Task.new(:docker) do |t|
    t.profile = "docker"
  end

  Cucumber::Rake::Task.new(:heroku) do |t|
    t.profile = "heroku"
  end

end

task :default => 'features:local'
