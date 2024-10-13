@login
Feature: Login functionality

  @pertemuan-3 @regression @case-7
  Scenario: [READ FILE] As a user, I want to be able to login to the application with my credentials
    Given I am on the login page
    When [READ FILE] I enter username as "VALID_USERNAME" on the login page
    And [READ FILE] I enter password as "VALID_PASSWORD" on the login page
    And I click the login button on the login page
    Then I should be logged in to the application