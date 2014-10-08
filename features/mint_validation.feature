Feature: Required keys must be present to pass Mint validation

Scenario Outline: All required high level keys must be present
  Given app mint
  When I POST to /titles/TEST123 without the <element> element
  Then I get an error

    Examples:
    | element |
    | title_number |
    | class_of_title |
    | tenure |
    | edition_date |
    | extent |
    | proprietorship |
    | property_description |
    | restrictive_covenants |
    | restrictions |
    | bankruptcy |
    | easements |
    | provisions |
    | price_paid |
    | h_schedule |
    | other |
    | charges |
