Feature: Review Submission
  In order to understand how employees are doing
  As a client
  I want to review an employee

  Scenario: Valid user
    Given I visit a unique, one use URL
    When I fill out feedback forms
    Then I should see
      """
      Thank you!
      """

  Scenario: Invalid user
    Given I visit a unique, one use URL
    Then I should see
      """
      Sorry, invalid user
      """

  Scenario: Incomplete feedback
    Given I visit a unique, one use URL
    When I fill out feedback forms
    Then I should see
      """
      Required
      """
