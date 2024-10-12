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