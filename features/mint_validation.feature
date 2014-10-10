Feature: Required keys must be present to pass Mint validation

Scenario Outline: All required high level keys must be present
  Given app mint
  When I POST to /titles/TEST123 without the <key> key
  Then I get an error for <key>

    Examples:
    | key |
    | title_number |
    | class_of_title |
    | tenure |
    | edition_date |
    | proprietorship |
    | property_description |
    | restrictive_covenants |
    | restrictions |
    | bankruptcy |
    | easements |
    | provisions |
    | other |
    | charges |
