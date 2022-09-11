# #10 - PUT CALL - Update User using #Karate [Latest 2022]
# https://www.youtube.com/watch?v=VrPqzGvxuxE&list=PLFGoYjJG_fqpUgFYoKIMZJAblUbGHSQAb&index=10

Feature: Update user using put api

Background:
    * url 'https://gorest.co.in'
    * def tokenID = '007526d9efdbc07e084ff7a6d4cfcc90588fbe20641c00faebf45a7f3b2eaf33'
    * def requestPayload =
    """
    {
        "status": "active",
        "name": "Magali",
        "email": "magali@turmadamonica.com.br"
    }
    """

Scenario: Create a user with a given data
    Given path '/public/v2/users/102'
    And request requestPayload
    And header Authorization = 'Bearer ' + tokenID
    When method PUT
    Then status 200
    And match $.id == '#present'
    And match $.name == '#present'
    And match $.name == 'Magali'
    And match $.email == 'magali@turmadamonica.com.br'
    And print response