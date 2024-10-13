Given('I have products as follows:') do |table|
  # table is a Cucumber::MultilineArgument::DataTable
  @list_product = table.hashes
end

When('I click the add to cart button for each products on the inventory page') do
  @list_product.each do |row|
    step 'I click the add to cart button for the product "' + row['product_name'] + '" on the inventory page'
  end
end

Then('I can see remove button for each products on the inventory page') do
  @list_product.each do |row|
    step 'I can see remove button for the product "' + row['product_name'] + '" on the inventory page'
  end
end


When('[READ FILE] I enter username as {string} on the login page') do |username|
  username_value = get_data_test(username)
  step 'I enter username as "' + username_value + '" on the login page'
end

When('[READ FILE] I enter password as {string} on the login page') do |password|
  password_value = get_data_test(password)
  step 'I enter password as "' + password_value + '" on the login page'
end