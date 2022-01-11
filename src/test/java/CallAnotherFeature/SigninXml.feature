@xml
Feature: call XML file
#  Background:
#    * url 'http://localhost:8080/rest/account/'
  Scenario: call XML file
#    * def xmlInput =
#    """
#    <?xml version="1.0" encoding="UTF-8" ?>
#    <account>
#        <firstName>demo3</firstName>
#        <lastName>duong</lastName>
#        <email>demo3@gmail.com</email>
#        <password>12345</password>
#    </account>
#    """
#    * json input = xmlInput
#    And print input
#    And request input
#    When method post
#
#    Then status 200
#    And print response


    * def doWork =
#        """
#        <?xml version="1.0"?>
#          <catalog>
#              <book id="bk101">
#                  <author>Gambardella, Matthew</author>
#                  <title>XML Developer's Guide</title>
#                  <genre>Computer</genre>
#                  <price>44.95</price>
#                  <publish_date>2000-10-01</publish_date>
#                  <description>An in-depth look at creating applications
#                      with XML.</description>
#              </book>
#          </catalog>
#
#        """

    * def requestXMLBody = read ('../Data/me.xml')
#    Given url 'http://dummy.restapiexample.com/api/v1/create'
#    When request requestXMLBody
#    And method post
#    Then status 200
    Given print  requestXMLBody