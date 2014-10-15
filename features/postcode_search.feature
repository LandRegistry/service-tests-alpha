Feature: Search title by postcode

  Scenario Outline: Mint a new title with postcode
    Given app mint
    When I POST to /titles/ignored with the fixture: "new_registration", substituting $..postcode with <postcode>
    Then I should get a 201 status code

      Examples:
      | postcode |
      | W1U 2NU  |
      | FK20 8RN |
      | GL16 9BE |
      | SA45 9NY |
      | CF14 1DG |
      | DT5 1EB  |
      | CV3 2ZZ  |
      | GL50 3JF |
      | TQ1 2JZ  |

  Scenario Outline: titles are searchable on postcode
    Given app search-api
    And I wait 10 seconds
    When I GET to /search?query=<postcode>
    Then I should get a 200 status code

      Examples:
      | postcode |
      | W1U+2NU  |
      | FK20+8RN |
      | GL16+9BE |
      | SA45+9NY |
      | CF14+1DG |
      | DT5+1EB  |
      | CV3+2ZZ  |
      | GL50+3JF |
      | TQ1+2JZ  |
