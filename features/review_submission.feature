Feature: Review Submission
  In order to understand how employees are doing
  As a client
  I want to review an employee

  Scenario: Valid user
    Given I visit a unique, one use URL
    When I fill out review forms
    Then I should see a thank you message

  Scenario: Invalid user
    Given I visit a unique, one use URL for an invalid user
    Then I should see an invalid user message

  Scenario: Incomplete review
    Given I visit a unique, one use URL
    When I submit the review form partially
    Then I should see required field notifications
