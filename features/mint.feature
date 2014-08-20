Feature: Mint title additions and amendments

  Scenario: Mint a new title
    Given app mint
    #When logging is enabled
    When I POST to /titles/TEST123 with the body:
    """
    {
      "proprietors":[
          {
            "first_name":"Testium",
            "last_name":"Testacular"
          },
          {
            "first_name":"Testy",
            "last_name":"McTestersons"
          }
      ],
      "title_number":"TEST123",
      "property":{
          "tenure":"Freehold",
          "class_of_title":"Absolute",
          "address":{
            "house_number":"123",
            "town":"Testville",
            "postcode":"TE12 3ST",
            "road":"Test Street"
          }
      },
      "payment":{
          "titles":[
            "TEST123"
          ],
          "price_paid":123000
      },
      "extent":{
          "type":"Feature",
          "crs":{
            "type":"name",
            "properties":{
                "name":"urn:ogc:def:crs:EPSG:27700"
            }
          },
          "geometry":{
            "type":"Polygon",
            "coordinates":[
                [
                  404433.40455968195,
                  369897.50687562325
                ],
                [
                  404433.90455968195,
                  369897.50687562325
                ],
                [
                  404433.90455968195,
                  369898.00687562325
                ],
                [
                  404433.40455968195,
                  369898.00687562325
                ],
                [
                  404433.40455968195,
                  369897.50687562325
                ]
            ]
          },
          "properties":{
            "Description":"Polygon"
          }
      }
    }
    """
    Then I should get a 201 status code 
    #Then debug

