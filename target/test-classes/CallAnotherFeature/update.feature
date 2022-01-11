@call
Feature: update info
  Background:
    * url baseUrl
    * header Accept = 'application/json'
    * def feature = read ('Getinfo.feature')
    * def result =  call feature
#    * print result.response.email
    * def input = read ('../Data/input.json')

    Scenario: update info
      Given path '/rest/account'
      And request input
      When method Put
      Then status 200
      And match response.email == result.response.email

#      * def result =  call feature
