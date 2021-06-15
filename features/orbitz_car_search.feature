Feature: Car Search functionality

  Scenario: Verify the user is able to search for the cars availiabilty
    Given user is on the orbitz homepage
    When user search for cars availability for future dates
    Then user should see the list of cars options