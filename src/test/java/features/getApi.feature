# #3 - GET API CALL in KARATE Framework
# https://www.youtube.com/watch?v=kwhn2nJpVNc&list=PLFGoYjJG_fqpUgFYoKIMZJAblUbGHSQAb&index=3

Feature: GET API feature

Background:
   * def  baseUrl = 'https://gorest.co.in'

Scenario: get user details
    Given url baseUrl+'/public/v2/users'
    And path '30'
    When method GET
    Then status 200
    * print response
    * def jsonResponse = response
    * print jsonResponse
    * def actName = jsonResponse.name
    * def actId = jsonResponse.id
    * def actEmail = jsonResponse.email
    * print actName
    * match actName == "Param Malik III"
    * match actId == 30
    * match actEmail == "malik_iii_param@berge.biz"

Scenario: get user details not found
    Given url baseUrl + '/public/v2/users'
    And path '1'
    When method GET
    Then status 404
    * print response