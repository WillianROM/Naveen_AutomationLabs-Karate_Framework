# #8 - Generate Random Email String in POST Call in #Karate [Latest 2022]
# https://www.youtube.com/watch?v=ILop93YVUao&list=PLFGoYjJG_fqpUgFYoKIMZJAblUbGHSQAb&index=8

Feature: Create user using post api

Background:
    * url 'https://gorest.co.in'
    * def tokenID = '007526d9efdbc07e084ff7a6d4cfcc90588fbe20641c00faebf45a7f3b2eaf33'

    * def random_string =
    """
        function(s){
            var text = "";
            var pattern = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwyz";
            for(var i=0; i<s; i++){
                text += pattern.charAt(Math.floor(Math.random() * pattern.length()));
                return text;
            }
        }
    """
    * def randomString = random_string(10)
    * print randomString

    * def requestPayload =
    """
    {
        "name":"jerry",
        "gender": "male",
        "status": "active"
    }

    requestPayload.email =  randomString+"@tomandjerry.com"
    print requestPayload
    """

Scenario: Create a user with a given data
    Given path '/public/v2/users'
    And request requestPayload
    And header Authorization = 'Bearer ' + tokenID
    When method POST
    Then status 201
    And match $.data.id == '#present'
    And match $.data.name == '#present'
    And match $.data.name == 'jerry'
    And match $.data.email == requestPayload.email 