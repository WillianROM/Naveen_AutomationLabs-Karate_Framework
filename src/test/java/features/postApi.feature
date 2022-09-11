# #7 - Post API CALL with KARATE [Latest 2022]
# https://www.youtube.com/watch?v=e68PJ16NDgQ&list=PLFGoYjJG_fqpUgFYoKIMZJAblUbGHSQAb&index=8
Feature: Create user using post api

Background:
    * url 'https://gorest.co.in'
    * def tokenID = '007526d9efdbc07e084ff7a6d4cfcc90588fbe20641c00faebf45a7f3b2eaf33'
    * def requestPayload =
    """
    {
        "name":"jerry",
        "email": "jerry2@tomandjerry.com",
        "gender": "male",
        "status": "active"
    }
    """

Scenario: Create a user with a given data
    Given path '/public/v2/users'
    And request requestPayload
    And header Authorization = 'Bearer ' + tokenID
    When method POST
    Then status 201
    And match $.id == '#present'
    And match $.name == '#present'
    And match $.name == 'jerry'
    And match $.email == 'jerry2@tomandjerry.com'