# #6 - Read Auth Bearer Token From Config Js File in Karate
# https://www.youtube.com/watch?v=W_5esuRjJH4&list=PLFGoYjJG_fqpUgFYoKIMZJAblUbGHSQAb&index=7
Feature: GET API feature with Auth Bearer

Background:
   * def baseUrl = 'https://gorest.co.in'
   * def tokenID = '007526d9efdbc07e084ff7a6d4cfcc90588fbe20641c00faebf45a7f3b2eaf33'

Scenario: get user details
    * print tokenID
    Given header Authorization = 'Bearer ' + tokenID
    Given url baseUrl+'/public/v1/users'
    And path '30'
    When method GET
    Then status 200