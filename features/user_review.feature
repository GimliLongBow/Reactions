Feature: User Review
  In order to examine employee satisfaction
  As an admin
  I want to see user status

  Scenario: User exists
    Given I am on the users list
    When I click on a specific user
    Then I should see
      """
      Overall average
      """
    And I should see
      """
      Latest reviews
      """
