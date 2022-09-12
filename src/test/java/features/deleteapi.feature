# #11 - DELETE CALL - Delete User using #Karate [Latest 2022]
# https://www.youtube.com/watch?v=9sJz2PPRdSg&list=PLFGoYjJG_fqpUgFYoKIMZJAblUbGHSQAb&index=11

Feature: Delete user using delete api

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
    

Scenario: Delete a user with a given user id
#1st call: Create a user using POST CALL
    Given path '/public/v2/users'
    And request requestPayload
    And header Authorization = 'Bearer ' + tokenID
    When method POST
    Then status 201
    And match $.id == '#present'
    And print response

#fetch the user id from the response
    * def userId = $.id
    * print userId

#2nd call: delete the same user
    Given path '/public/v2/users/' + userId
    And header Authorization = 'Bearer ' + tokenID
    When method DELETE
    Then status 204
    And print response

#3rd call: get the same user with user id
    Given path '/public/v2/users/' + userId
    When method GET
    Then status 404
    And match $.message == 'Resource not found'
    And print response