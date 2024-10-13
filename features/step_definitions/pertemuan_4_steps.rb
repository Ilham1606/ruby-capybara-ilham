Given('[PAGE OBJECT] I am on the login page') do
  @page.login_page.load
end

When('[PAGE OBJECT] I enter username as {string} on the login page') do |username|
  username_value = get_data_test(username)
  @page.login_page.input_username(username_value)
end

When('[PAGE OBJECT] I enter password as {string} on the login page') do |password|
  password_value = get_data_test(password)
  @page.login_page.input_password(password_value)
end

When('[PAGE OBJECT] I click the login button on the login page') do
  @page.login_page.click_btn_login
end

Then('[PAGE OBJECT] I should be logged in to the application') do
  expect(URI.parse(current_url)).to have_content("/inventory.html")
  @page.inventory_page.validate_page
end

When('[PAGE OBJECT] I click the add to cart button for the product {string} on the inventory page') do |product_name|
  @page.inventory_page.add_to_cart_product(product_name)
end

Then('[PAGE OBJECT] I can see remove button for the product {string} on the inventory page') do |product_name|
  @page.inventory_page.btn_remove_cart_is_visible(product_name)
end