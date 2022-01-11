Feature: config feature
  Background:
    * url baseUrl
    * header Accept = 'application/json'


  Scenario: Config demo 1
    Given print name


  Scenario: Config demo 2
    Given path '/rest/account/authentication'
    * def params =
        """
          {
            'action' : 'login',
            'email' : "demo50@gmail.com",
            'password': "demo"
          }
        """
    And form fields params
    When method get
    Then status 200
