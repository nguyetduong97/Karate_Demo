@GetMovieList


Feature: Get information movie schedule
  Background:
    * url 'http://localhost:8080/rest/schedule/'
    * def expectedOutput = read ('classpath:src/test/java/Response/MovieSchedule.json')

  Scenario: Verify information of movie schedule
    When method Get
    Then status 200
#      And print response
#    And print response.movie[0].date
    And match response == expectedOutput