Feature: Mint title additions and amendments
  Scenario: Mint a new title 3
    Given app mint
    When I POST to /titles/ignored with the fixture: "new_registration3"
    Then I should get a 201 status code 

  Scenario: Mint a new title 2
    Given app mint
    When I POST to /titles/ignored with the fixture: "new_registration2"
    Then I should get a 201 status code 

  Scenario: Mint a new title 
    Given app mint
    When I POST to /titles/ignored with the fixture: "new_registration"
    Then I should get a 201 status code 

  Scenario: Mint a new title 4 
    Given app mint
    When I POST to /titles/ignored with the fixture: "new_registration4"
    Then I should get a 201 status code 
