@smoke
Feature: Confirm applications are healthy

  Scenario: system-of-record is healthy
    Given app system-of-record
    #When logging is enabled
    When I GET to /health
    Then I should get a 200 status code 
    #Then debug

  Scenario: casework-frontend is healthy
    Given app casework-frontend
    When I GET to /health
    Then I should get a 200 status code

  Scenario: property-frontend is healthy
    Given app property-frontend
    When I GET to /health
    Then I should get a 200 status code

  Scenario: mint is healthy
    Given app mint
    When I GET to /health
    Then I should get a 200 status code

  Scenario: search-api is healthy
    Given app search-api
    When I GET to /health
    Then I should get a 200 status code

  Scenario: service-frontend is healthy
    Given app service-frontend
    When I GET to /health
    Then I should get a 200 status code


