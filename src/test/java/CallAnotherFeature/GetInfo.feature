@get
Feature: get info
  Background:
    * url baseUrl
    * header Accept = 'application/json'
    * def result = read ('../Data/dataresult.json')

    Scenario: get info account 1
      Given path '/rest/account/e4109405-5efc-48f9-9a80-c53a16ea738f'
      When method Get
      Then status 200
      And match response == result[0]

    Scenario: get info account 2
      Given path '/rest/account/94b5e1da-ff5a-4b88-a0c6-c3797b1872c7'
      When method Get
      Then status 200
      And match response == result[1]