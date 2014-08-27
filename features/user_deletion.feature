Feature: User Management
  In order to remove old users
  As an admin
  I want to delete an existing user

  Scenario: User exists
    Given I am on viewing an existing user
    When I click on "Delete"
    Then a new user should be destroyed
    And all associated feedback should be destroyed
