require 'capybara/cucumber'
require 'capybara/rspec'
require 'cucumber'
require 'dotenv'
require 'selenium-webdriver'
require 'site_prism'
require 'yaml'

Dotenv.load

Capybara.register_driver :chrome do |app|
  options = Selenium::WebDriver::Chrome::Options.new
  if ENV['INCOGNITO'] == 'yes'
    options.add_argument('--incognito')
  end
  
  if ENV['HEADLESS'] == 'yes'
    options.add_argument('--headless')
    options.add_argument('--disable-gpu')
  end

  Capybara::Selenium::Driver.new(
    app,
    browser: :chrome,
    options: options,
    timeout: 30
  )
end

Capybara.register_driver :firefox do |app|
  options = Selenium::WebDriver::Firefox::Options.new
  if ENV['PRIVATE'] == 'yes'
    options.add_argument('-private-window')
  end
  
  if ENV['HEADLESS'] == 'yes'
    options.add_argument('--headless')
  end

  Capybara::Selenium::Driver.new(
    app,
    browser: :firefox,
    options: options,
    timeout: 30
  )
end

Capybara.configure do |config|
  config.default_driver = :firefox
  config.default_max_wait_time = 30
end

# single env
def get_data_test_single_env(key)
  file = YAML.load_file("features/support/data/data-test.yml")
  return file[key]
end

# multi env 
def get_data_test(key)
  file = YAML.load_file("features/support/data/data-test-#{ ENV['TARGET'].downcase }.yml")
  return file[key]
end