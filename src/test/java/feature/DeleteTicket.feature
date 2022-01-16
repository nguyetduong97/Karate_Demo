#@ignore
#Feature: Create a ticket then delete this ticket
#

#
#  Scenario: Book a ticket
#    Given path 'booking'
#    * def body =
#        """
#          {
#            'token': "9c01ba59-817b-4755-a45e-d63c51e3e246",
#            'sessionID': "c49360a8-f31d-4a14-9291-bb1bf641ac16",
#            'chairs': "A6"
#          }
#        """
#    And request body
#    When method post
#    Then status 200
##    And match response.chairs[0] == body.chairs
##    And print response.chairs
##    And match response.account.token[0] == body.token
##    And print response.account
##    And match response.movieSession.sessionID[0] == body.sessionID
##    And print response.movieSession
##    And print response.ticketNumber
#
#    * def token = '9c01ba59-817b-4755-a45e-d63c51e3e246'
#    Given path 'booking' + response.ticketNumber
#    And form fields token
#    When method delete
#    Then status 200
#    And match response contains 'your booking number has been deleted'


  @ignore
  Feature: Delete ticket
    Background:
    * header Accept = 'application/json'
  Scenario Outline: Delete
    * def param =
    """
      {
        'token': <token>
      }
    """
    Given url 'http://localhost:8080/rest/booking/' 
    And path <numberTicket>
    And params param
    When method delete
    Then status 200
    And match response.message == 'your booking number <numberTicket> has been deleted'
    And print response
    Examples:
      |numberTicket|token  |
      |6|8e28b339-2173-4651-9608-31067901efea|

#    comment git ticket6
