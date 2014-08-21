Feature: Mint title additions and amendments

  Scenario: Mint a new title
    Given app mint
    #When logging is enabled
    When I POST to /titles/TEST123 with the fixture: "new_registration"
    Then I should get a 201 status code 
    #Then debug
    
  Scenario: Mint an empty title
    Given app mint
    When I POST to /titles/TEST123 with the fixture: "bad_registration"
    Then I should get a 400 status code 

  Scenario: Store a new title
    Given app system-of-record
    When I GET to /titles/TEST123
    Then the response is valid according to the "systemofrecord" schema
