Feature: JPH04 Kullanici Json objesi olan test datalarini Feature disinda olusturabilmeli
  Background:
    * def baseUrl = 'https://jsonplaceholder.typicode.com'
    * def pathParams = '/posts/70'
    * def requestBody = read("td_requestBody.json")
    * def expectedResponse = read("td_expectedResponse.json")

  @api
  Scenario: TC04 Disardan Json Obje Kullanilabilmeli
    Given url baseUrl
    And path pathParams
    And request requestBody
    When method PUT
    Then status 200
    And match header Content-Type == 'application/json; charset=utf-8'
    And match header Connection == 'keep-alive'
    And match response == expectedResponse