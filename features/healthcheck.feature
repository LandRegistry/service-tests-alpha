@smoke
Feature: Confirm applications are healthy

  # I'm well aware of scenario outlines for lowering the copy/paste
  # effort, but the '--out report.json' doesn't show pass/fail
  # for the individual apps.

  # Scenario Outline: apps are healthy
  #  Given app <app>
  #  When I GET to /health
  #  Then I should get a 200 status code
  #
  #  Examples:
  #    | app               |
  #    | system-of-record  |
  #    | casework-frontend |
  #    | property-frontend |
  #    | mint              |
  #    | search-api        |
  #    | service-frontend  |
  #    | decision          |
  #    | ownership         |
  #    | matching          |
  #    | introductions     |
  #    | cases             |
  #    | historian         |

  Scenario: system-of-record is healthy
    Given app system-of-record
    When I GET to /health
    Then I should get a 200 status code
 
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
 
  Scenario: decision is healthy
    Given app decision
    When I GET to /health
    Then I should get a 200 status code
 
  Scenario: ownership is healthy
    Given app ownership
    When I GET to /health
    Then I should get a 200 status code

   Scenario: matching is healthy
    Given app matching
    When I GET to /health
    Then I should get a 200 status code

  Scenario: introductions is healthy
    Given app introductions
    When I GET to /health
    Then I should get a 200 status code
 
  Scenario: cases is healthy
    Given app cases
    When I GET to /health
    Then I should get a 200 status code
 
  Scenario: historian is healthy
    Given app historian
    When I GET to /health
    Then I should get a 200 status code
 
