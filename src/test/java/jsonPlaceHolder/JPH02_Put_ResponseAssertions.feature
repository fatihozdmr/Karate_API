Feature: JPH02 PUT request sonucu donen response bilgilerini test eder

  @api
  Scenario: TC02 Put request sonucu donen response expected degerlere uygun olmali

    Given url 'https://jsonplaceholder.typicode.com'
    And path '/posts/70'
    And request
  """
  {
  "id": 70,
  "title": "Ahmet",
  "body": "Merhaba",
  "userId": 10
  }
  """
    When method PUT
    Then status 200
    And match header Content-Type == 'application/json; charset=utf-8'
    And match header Connection == 'keep-alive'
    And assert response.title == 'Ahmet'
    And assert response.body == 'Merhaba'
    And assert response.userId == 10
    And assert response.id == 70