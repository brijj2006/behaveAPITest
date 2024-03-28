Feature: Test Asset Endpoints

  @simple_test
  Scenario: run a simple test
    Given asset setup is done
    When user checks quota for "S0000007A"
    Then user details are fetched correctly
      | categoryId                           | currentQuota | totalQuota |
      | adb97b74-fa1c-4240-8d3e-8fc94e8ab988 | 3            | 3          |
      | 35206b73-5cd3-40b7-b550-590942229a78 | 3            | 3          |

  @data_driven_tests
  Scenario Outline: run a simple test
    Given asset setup is done
    When user checks quota for "<external_uin>"
    Then user details are fetched correctly
      | categoryId      | currentQuota      | totalQuota      |
      | <categoryId_01> | <currentQuota_01> | <totalQuota_01> |
      | <categoryId_02> | <currentQuota_02> | <totalQuota_02> |
    Examples:
      | external_uin | categoryId_01                        | currentQuota_01 | totalQuota_01 | categoryId_02                        | currentQuota_02 | totalQuota_02 |
      | S0000001A    | adb97b74-fa1c-4240-8d3e-8fc94e8ab988 | 1               | 4             | 35206b73-5cd3-40b7-b550-590942229a78 | 3               | 3             |
      | S0000002A    | adb97b74-fa1c-4240-8d3e-8fc94e8ab988 | 3               | 3             | 35206b73-5cd3-40b7-b550-590942229a78 | 3               | 3             |
      | S0000003A    | adb97b74-fa1c-4240-8d3e-8fc94e8ab988 | 3               | 3             | 35206b73-5cd3-40b7-b550-590942229a78 | 3               | 3             |
      | S0000004A    | adb97b74-fa1c-4240-8d3e-8fc94e8ab988 | 3               | 3             | 35206b73-5cd3-40b7-b550-590942229a78 | 3               | 3             |
      | S0000005A    | adb97b74-fa1c-4240-8d3e-8fc94e8ab988 | 3               | 3             | 35206b73-5cd3-40b7-b550-590942229a78 | 3               | 3             |