
Feature: Update information for account

  #Anything defined under background that will be applied for all Scenario in this feature file
  Background:
    * url baseUrl
    * header Accept = 'application/json'
    * def <string> =

  #Set tags for run test
  @update
  Scenario Outline: Verify update info successfully
    #<def> Defines the values of the variables
    Given path '/rest/account'
    * def info =
   """
      {
        'token': <token>,
        'firstName': <firstName>,
        'lastName': <lastName>,
      }
    """
    And request info
    When method put
    Then status 200
    #<match> Is is used for asserting values on the response body
    And match response.firstName == info.firstName
    And print response.firstName
    And match response.lastName == info.lastName
    #<print> it used to print the response body request
    And print response.lastName

    Given path response.token
    When method get
    Then status 200
    And print response

    Examples:
      |token|firstName|lastName|
      |8e28b339-2173-4651-9608-31067901efea|Nguyet|Duongg|