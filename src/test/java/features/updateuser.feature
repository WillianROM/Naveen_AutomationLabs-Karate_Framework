# #10 - PUT CALL - Update User using #Karate [Latest 2022]
# https://www.youtube.com/watch?v=VrPqzGvxuxE&list=PLFGoYjJG_fqpUgFYoKIMZJAblUbGHSQAb&index=10

Feature: Update user using put api

Background:
    * url 'https://gorest.co.in'
    * def tokenID = '007526d9efdbc07e084ff7a6d4cfcc90588fbe20641c00faebf45a7f3b2eaf33'

    * def random_string =
    """
        function(s){
            var text = "";
            var pattern = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwyz";
            for(var i=0; i<s; i++)
                text += pattern.charAt(Math.floor(Math.random() * pattern.length()));
                return text;
        }
    """
    * def randomString = random_string(10)
    * print randomString

    * def requestPayload =
    """
    {
        "name": "jerry",
        "gender": "male",
        "status": "active"
    }
    """
    * requestPayload.email =  randomString+"@tomandjerry.com"
    * print requestPayload
    

Scenario: Update a user with a given data
#1st call: create a user with post call
    Given path '/public/v2/users'
    And request requestPayload
    And header Authorization = 'Bearer ' + tokenID
    When method POST
    Then status 201
    And match $.id == '#present'
    And print response
    
#fetch the user id from the post call response
    * def userId = $.id
    * print userId

#2nd call: put call -- to update the user
* def requestPutPayload =
"""
{
  
    "gender": "male",
    "status": "inactive"
}
"""

    Given path '/public/v2/users/' + userId
    And request requestPutPayload
    And header Authorization = 'Bearer ' + tokenID
    When method PUT
    Then status 200
    And match $.id == '#present'
    And match $.id == userId
    And match $.name == '#present'
    And match $.name == 'jerry'
    And match $.email == requestPayload.email 
    And print response