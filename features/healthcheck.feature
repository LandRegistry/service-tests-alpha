@smoke
Feature: Confirm applications are healthy
  Scenario Outline: apps are healthy
    Given app <app>
    When I GET to /health
    Then I should get a 200 status code

    Examples:
      | app               |
      | system-of-record  |
      | casework-frontend |
      | property-frontend |
      | mint              |
      | search-api        |
      | service-frontend  |
      | decision          |
      | ownership         |
      | matching          |
      | introductions     |
      | cases             |
      | historian         |
