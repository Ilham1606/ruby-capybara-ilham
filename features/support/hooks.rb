Before do
  Capybara.page.current_window.maximize
  @page = Page.new
  puts "INI HOOKS BEFORE"
end

After do |scenario|
  puts "INI HOOKS AFTER"

  if scenario.failed?
    take_screenshot
  end
end

Before('@case-3') do
  puts "HOOKS INI HANYA DIJALANKAN UNTUK TAGS @CASE-3"
end

After('@case-2') do
  puts "HOOKS INI HANYA DIJALANKAN UNTUK TAGS @CASE-2"
end

AfterStep do
  sleep 1
end

at_exit do
  puts "GENERATE REPORT"
  generate_report
  Kernel.exit(0)
end