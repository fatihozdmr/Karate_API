Feature: JPH03 Kullanici test datalarini feature icinde testten once tanimlayabilmeli

  Background: Test datalarini tanimlama
    * def baseUrl = 'https://jsonplaceholder.typicode.com'
    * def pathParams = '/posts/70'
    * def requestBody =
    """
  {
  "id": 70,
  "title": "Ahmet",
  "body": "Merhaba",
  "userId": 10
  }
    """
    * def expectedResponse =
    """
  {
  "id": 70,
  "title": "Ahmet",
  "body": "Merhaba",
  "userId": 10
  }
    """

  @api
  Scenario: TC03 Background Kullanilabilmeli
    Given url baseUrl
    And path pathParams
    And request requestBody
    When method PUT
    Then status 200
    And match header Content-Type == 'application/json; charset=utf-8'
    And match header Connection == 'keep-alive'
    And match response == expectedResponse