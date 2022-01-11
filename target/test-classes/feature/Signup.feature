@SignUp
Feature: Sign up for an account
  #Anything defined under background that will be applied for all Scenario in this feature file
  Background:
    * url 'http://localhost:8080/rest/account/'
    * def input = read('classpath:src/test/java/request/data.csv')
  Scenario Outline: Verify sign up an account successfully
    * def req =
    """
      {
        "firstName": <firstName>,
        "lastName": <lastName>,
        "email": <email>,
        "password": <password>
      }
    """
    And request req
    When method post

    Then status 200
    And match response contains {"firstName": <firstName>, "lastName": <lastName>,"email": <email>,"password": <password>}
    Then print response

    Examples:
      |input|

  Scenario Outline: Verify the invalid email
    * def req =
    """
      {
        "firstName": <firstName>,
        "lastName": <lastName>,
        "email": <email>,
        "password": <password>
      }
    """
    And request req
    When method post
    Then status 200
    And match response.error == "your email is not valid"
    And def res = response.error
    And print res
    Examples:
      |input|




