Feature: Login functionality

  @pertemuan-1 @regression @positive @case-1
  Scenario: As a user, I want to be able to login to the application with my credentials
    Given I am on the login page
    When I enter my username and password
    And I click the login button
    Then I should be logged in to the application

  @pertemuan-2 @regression @case-2
  Scenario: [parsing parameter] As a user, I want to be able to login to the application with my credentials
    Given I am on the login page
    When I enter username as "standard_user" on the login page
    And I enter password as "secret_sauce" on the login page
    And I click the login button on the login page
    Then I should be logged in to the application