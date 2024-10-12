Feature: Inventory functionality

    Background: User login and navigate to Inventory page
        Given I am on the login page
        When I enter username as "standard_user" on the login page
        And I enter password as "secret_sauce" on the login page
        And I click the login button on the login page
        Then I should be logged in to the application

    @pertemuan-3 @case-4
    Scenario Outline: [Examples] As a User, I want to add to cart a product
        When I click the add to cart button for the product "<product_name>" on the inventory page
        Then I can see remove button for the product "<product_name>" on the inventory page
    
    Examples:
        | product_name             |
        | Sauce Labs Bike Light    |
        | Sauce Labs Fleece Jacket |

    @pertemuan-3 @case-5
        Scenario: [Data Table] As a User, I want to add to cart mutiple product
        Given I have products as follows:
        | product_name             |
        | Sauce Labs Bike Light    |
        | Sauce Labs Fleece Jacket |
        When I click the add to cart button for each products on the inventory page
        Then I can see remove button for each products on the inventory page