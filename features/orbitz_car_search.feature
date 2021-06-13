Feature: Car Search functionality

  Scenario: verify user is able to search for the cars available
    Given user is on the orbitz homepage
    When user search for cars availability for future dates
    Then user should see the list of cars options


