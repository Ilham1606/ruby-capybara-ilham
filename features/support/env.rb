require 'capybara/cucumber'
require 'capybara/rspec'
require 'cucumber'
require 'dotenv'
require 'report_builder'
require 'rspec'
require 'selenium-webdriver'
require 'site_prism'
require 'yaml'

Dotenv.load

Capybara.register_driver :chrome do |app|
  options = Selenium::WebDriver::Chrome::Options.new

  if ENV['HEADLESS'].downcase == 'yes'
    options.add_argument('--headless')
  end

  if ENV['PRIVATE'].downcase == 'yes'
    options.add_argument('--incognito')
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

  if ENV['HEADLESS'].downcase == 'yes'
    options.add_argument('--headless')
  end

  if ENV['PRIVATE'].downcase == 'yes'
    options.add_argument('--incognito')
  end

  Capybara::Selenium::Driver.new(
    app,
    browser: :firefox,
    options: options,
    timeout: 30
  )
end

Capybara.configure do |config|
  config.default_driver = (ENV['BROWSER'] || 'firefox').to_sym
  config.default_max_wait_time = 30
end

# single env
def get_data_test_single_env(key)
  file = YAML.load_file("features/support/data/data-test.yml")
  return file[key]
end

# multy env
def get_data_test(key)
  file = YAML.load_file("features/support/data/data-test-#{ ENV['TARGET'].downcase }.yml")
  return file[key]
end

def generate_report
  ReportBuilder.configure do |config|
    time = Time.now.strftime("%Y-%m-%d %H%M%S%L")
    config.input_path = 'features/support/reports/result-cucumber.json'
    config.report_path = 'features/support/reports/test_result_' + time
    config.report_types = [:html]
    config.report_title = "Test Result"
    config.includes_image = true
  end
  ReportBuilder.build_report
end


def take_screenshot
  # Define the directory where screenshots will be saved
  screenshot_dir = 'features/support/reports/screenshot'

  # Ensure the directory exists
  FileUtils.mkdir_p(screenshot_dir)

  # Generate a timestamp for the screenshot filename
  time = Time.now.strftime("%Y-%m-%d %H%M%S%L")

  # Construct the full file path for the screenshot
  screenshot_path = "#{screenshot_dir}/#{time}.png"

  # Save the screenshot using Capybara
  Capybara.current_session.driver.save_screenshot(screenshot_path)

  # Read the saved screenshot
  image = open(screenshot_path, 'rb', &:read)

  # Attach the screenshot to the report (for example, if using Cucumber)
  attach(image, 'image/png', time)
end