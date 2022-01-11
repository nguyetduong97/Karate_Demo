@SignupCSV
Feature: Signin account with input by csv file

  Background:
    * url 'http://localhost:8080'
#    * header Accept = 'application/json'

    Scenario Outline:
      Given path "/rest/account/"
#      * def input =
#      """
#      {"firstName": <firstName>, "lastName" : <lastName>, "email": <email>, "password": <password>}
#      """
      * text params =
      """
        firstName,lastName,email,password
        User3,login,User3@gmail.com,12345
      """
      * csv input = params
      And print input[0]
#      And request input[0]
#      When method get
#      Then status 200
      Examples:
        |read('classpath:src/test/java/request/data.csv')|
#      And match response contains {"firstName": "#(firstName)", "lastName": "#(lastName)","email": "password","password": "#(password)"}

#      * def email = response.email
#      * def pass = response.password
#
#      Given path "/rest/account/authentication"
#      * def params =
#        """
#          {
#            'action' : 'login',
#            'email' : <email>,
#            'password': <pass>
#          }
#        """
#      And form fields params
#      When method Get
#      Then status 200
#      And match response.email == params.email
#      And match response.password == params.password
#      And match response.token == '#notnull'

