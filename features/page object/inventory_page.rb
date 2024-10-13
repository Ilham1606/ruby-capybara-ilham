require_relative 'page/base_page'

class InventoryPage < SitePrism::Page
  include BasePage

  set_url get_data_test("BASE_URL") + "/inventory.html"

  element :list_product, :xpath, "//*[@data-test='inventory-list']"


  def validate_page
    expect(page).to have_content("Products")
    expect(page).to have_content("Swag Labs")
    list_product.should be_visible
  end

  def add_to_cart_product(product_name)
    selector = "//div[div/a/div[text()='#{product_name}']]//button[contains(text(),'Add to cart')]"
    find(:xpath, selector).click
  end

  def btn_remove_cart_is_visible(product_name)
    selector = "//div[contains(@class, 'inventory_item')]//div[text()='#{product_name}']/ancestor::div[contains(@class, 'inventory_item')]//button[contains(text(), 'Remove')]"
    find(:xpath, selector).should be_visible
  end

end