When('I enter username as {string} on the login page') do |username|
  find(:xpath, "//input[@id='user-name']").set(username)
end

When('I enter password as {string} on the login page') do |password|
  find(:xpath, "//input[@id='password']").set(password)
end

When('I click the login button on the login page') do
  find(:xpath, "//input[@id='login-button']").click
  sleep 3
end

When('I click the add to cart button for the product {string} on the inventory page') do |string|
  find(:xpath, "//div[div/a/div[text()='#{product_name}']]//button[contains(text(),'Add to cart')]").click
end

Then('I can see remove button for the product {string} on the inventory page') do |string|
  find(:xpath, "//div[contains(@class, 'inventory_item')]//div[text()='#{product_name}']/ancestor::div[contains(@class, 'inventory_item')]//button[contains(text(), 'Remove')]").should be_visible
end
