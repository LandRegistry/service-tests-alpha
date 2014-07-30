[![Build Status](https://travis-ci.org/LandRegistry/api-tests.svg)](https://travis-ci.org/LandRegistry/api-tests)

# API Tests

## Installing

Install all dependencies with [Bundler](http://bundler.io/):

    bundle install

# Running the tests

Export the necessary BasicAuth credentials to your environment before you start:

    export HTTPBASICAUTH_USERNAME='redacted'
    export HTTPBASICAUTH_PASSWORD='redacted'

Run the test tasks with [Rake](https://github.com/jimweirich/rake):

    rake # defaults to 'local'
    rake features:local
    rake features:docker
    rake features:heroku

Or to run a specific feature:

    cucumber features/sample.feature

## Example run output

![screenshot](http://i.imgur.com/iw1NMUo.png)
