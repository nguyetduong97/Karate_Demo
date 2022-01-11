@calljava
Feature: Java function
  Background:
    * url baseUrl
    * header Accept = 'application/json'
    * def CallJava =  Java.type('Java.JavaFunctions')

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
#    And match response.email == params.email
#    And match response.password == params.password
#    And match response.token == '#notnull'
#
    * def actualEmail = CallJava.getEmail(response)
    And  print actualEmail
    And match actualEmail contains <email>


    Examples:
      |read('classpath:src/test/java/request/data.csv')|

#    @callJS
    Scenario: Call function js to feature
      * def js = read ('function.js')
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
      * def result = js(response.token)
      And print result

#    @callmultiJS
    Scenario: Call multiplefunction js to feature
      * def js2 = read ('multipleFunc.js')
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
      * def results = js2()
      * def name = results.getName(response.firstName + response.lastName)
      And print name
      * def actemail = results.getEmail(response.email)
      And match actemail == 'Email is: demo50@gmail.com'
