# #4 - Query Parameter [GET API CALL] in KARATE Framework
# https://www.youtube.com/watch?v=Xb2MHnT5nGU&list=PLFGoYjJG_fqpUgFYoKIMZJAblUbGHSQAb&index=4

Feature: GET API with Query Paramenters

Background:
    * def  baseUrl = 'https://gorest.co.in'

Scenario: get all active users
    * def query = {status:'active', gender:'female'}

    Given url baseUrl+'/public/v2/users'
    And params query
    When method GET
    Then status 200
    * print response

Scenario: get all active users and get the count
    * def query = {status:'active'}

    Given url baseUrl+'/public/v2/users'
    And params query
    When method GET
    Then status 200
    * def jsonResponse = response
    * print jsonResponse
    * def userCount = jsonResponse.length
    * print userCount
    * match userCount == 10