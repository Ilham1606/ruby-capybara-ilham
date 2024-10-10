require 'capybara/cucumber'
#require 'capybara/rspec'
require 'cucumber'
require 'selenium-webdriver'

Capybara.register_driver :chrome do |app|
  options = Selenium::WebDriver::Chrome::Options.new

  Capybara::Selenium::Driver.new(
    app,
    browser: :chrome,
    options: options,
    timeout: 30
  )
end

Capybara.configure do |config|
  config.default_driver = :chrome
  config.default_max_wait_time = 30
end