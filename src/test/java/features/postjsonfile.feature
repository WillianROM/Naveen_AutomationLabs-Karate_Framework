# #9 - Pass JSON File in POST Call in #Karate [Latest 2022]
# https://www.youtube.com/watch?v=XjRVJ2OfwyE&list=PLFGoYjJG_fqpUgFYoKIMZJAblUbGHSQAb&index=10

Feature: Create user using post api with json file

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

    * def requestPayload = read('../../resources/payload/user.json')

    * requestPayload.email =  randomString+"@tomandjerry.com"
    * print requestPayload

Scenario: Create a user with a given data
    Given path '/public/v2/users'
    And request requestPayload
    And header Authorization = 'Bearer ' + tokenID
    When method POST
    Then status 201
    And match $.id == '#present'
    And match $.name == '#present'
    And match $.name == 'jerry'
    And match $.email == requestPayload.email 