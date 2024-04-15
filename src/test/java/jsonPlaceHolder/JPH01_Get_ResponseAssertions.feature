Feature: JPH01 Kullanici Get request sonucu donen response'i test eder

  @api
  Scenario: TC01 Get request'e donen response'in beklenilen ozelliklerde olmasi gerekir

    Given url 'https://jsonplaceholder.typicode.com/posts/44'
    When method get
    Then status 200
    And match header Content-Type == 'application/json; charset=utf-8'
    And match response.userId == 5
    And assert response.title == 'optio dolor molestias sit'
