Given('I am on the login page') do
  visit 'https://www.saucedemo.com/'
end

When('I enter my username and password') do
  find(:xpath, "//input[@id='user-name']").set("standard_user")
  find(:xpath, "//input[@id='password']").set("secret_sauce")
end

When('I click the login button') do
  find(:xpath, "//input[@id='login-button']").click
  sleep 3
end

Then('I should be logged in to the application') do
  expect(URI.parse(current_url)).to have_content("/inventory.html")
end