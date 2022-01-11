@login
Feature: API Authentication: Login
  Background:
    * url baseUrl
    * header Accept = 'application/json'

  Scenario Outline: Verify login successfully
    Given path '/rest/account/authentication'
    * def params =
        """
          {
            'action' : 'login',
            'email' : <email>,
            'password': <password>
          }
        """
    And form fields params
    When method get
    Then status 200
    And match response.email == params.email
    And match response.password == params.password
    And match response.token == '#notnull'

    And print response.token

    * def actualToken = response.token

    Given path '/rest/account/' + actualToken
    When method Get
    Then status 200
    And match response.token == actualToken
    And print response.token

    Examples:
      |read('classpath:src/test/java/request/data.csv')|
#      |email           |password|
#      |demo39@gmail.com|demo|
#      |demo40@gmail.com|demo|






