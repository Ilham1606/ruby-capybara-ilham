Feature: Inventory functionality

  @pertemuan-4 @regression @case-8
  Scenario: [PAGE OBJECT] As a user, I want to be able to login to the application with my credentials
    Given [PAGE OBJECT] I am on the login page
    When [PAGE OBJECT] I enter username as "VALID_USERNAME" on the login page
    And [PAGE OBJECT] I enter password as "VALID_PASSWORD" on the login page
    And [PAGE OBJECT] I click the login button on the login page
    Then [PAGE OBJECT] I should be logged in to the application

  @pertemuan-4 @case-9
  Scenario Outline: [Examples] As a User, I want to add to cart a product
    Given [PAGE OBJECT] I am on the login page
    When [PAGE OBJECT] I enter username as "VALID_USERNAME" on the login page
    And [PAGE OBJECT] I enter password as "VALID_PASSWORD" on the login page
    And [PAGE OBJECT] I click the login button on the login page
    Then [PAGE OBJECT] I should be logged in to the application
    When [PAGE OBJECT] I click the add to cart button for the product "<product_name>" on the inventory page
    Then [PAGE OBJECT] I can see remove button for the product "<product_name>" on the inventory page

    Examples:
      | product_name             |
      | Sauce Labs Bike Light    |
      | Sauce Labs Fleece Jacket |