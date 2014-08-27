Feature: User Creation
  In order to create a user
  As an admin
  I want to create a new user

  Scenario: Email is not in use
    Given I am on the users index
    When I click on "Add a new user"
    And I fill out the fields
    Then a new user should be created

  Scenario: Email is currently used
    Given I am on the users index
    When I click on "Add a new user"
    And I fill out the fields with a currently used email
    Then a new user should not be created
