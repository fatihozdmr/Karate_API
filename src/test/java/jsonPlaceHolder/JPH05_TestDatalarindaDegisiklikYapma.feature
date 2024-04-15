Feature: JPH05 Kullanici Disardan kullandigi json objelerinde degisiklik yapabilmeli
  Background:
    * def baseUrl = 'https://jsonplaceholder.typicode.com'
    * def pathParams = '/posts/70'
    * def requestBody = read("td_requestBody.json")
    * def expectedResponse = read("td_expectedResponse.json")

  @api
  Scenario: TC05 Disardan Json Obje Degisiklik
    Given url baseUrl
    And path pathParams
    Then set requestBody.title = 'Karate'
    And set requestBody.body = 'Framework'
    And request requestBody
    When method PUT
    Then status 200
    And match header Content-Type == 'application/json; charset=utf-8'
    And match header Connection == 'keep-alive'
    Then set expectedResponse.title = 'Karate'
    And set expectedResponse.body = 'Framework'
    And match response == expectedResponse