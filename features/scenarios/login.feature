Feature: Login functionality

  @pertemuan-1
  Scenario: As a user, I want to be able to login to the application with my credentials
    Given I am on the login page
    When I enter my username and password
    And I click the login button
    Then I should be logged in to the application