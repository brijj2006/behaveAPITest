Feature: Test Asset Endpoints

  Scenario: run a simple test
    Given asset setup is done
    When user checks quota for "S0000007A"
    Then user details are fetched correctly
      | categoryId                           | currentQuota | totalQuota |
      | adb97b74-fa1c-4240-8d3e-8fc94e8ab988 | 3            | 3          |
      | 35206b73-5cd3-40b7-b550-590942229a78 | 3            | 3          |