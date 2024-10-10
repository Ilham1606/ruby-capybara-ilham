Feature: Inventory functionality

  @pertemuan-2 @case-3
  Scenario: As a User, I want to add to cart a product
    Given I am on the login page
    When I enter username as "standard_user" on the login page
    And I enter password as "secret_sauce" on the login page
    And I click the login button on the login page
    Then I should be logged in to the application
    When I click the add to cart button for the product "Sauce Labs Backpack" on the inventory page
    Then I can see remove button for the product "Sauce Labs Backpack" on the inventory page