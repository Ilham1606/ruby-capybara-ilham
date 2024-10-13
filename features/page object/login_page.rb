require_relative 'page/base_page'

class LoginPage < SitePrism::Page
  include BasePage

  set_url get_data_test("BASE_URL")

  element :txt_username, :xpath, "//input[@id='user-name']"
  element :txt_password, :xpath, "//input[@id='password']"
  element :btn_login, :xpath, "//input[@id='login-button']"

  def input_username(username)
    txt_username.set(username)
  end

  def input_password(password)
    txt_password.set(password)
  end

  def click_btn_login
    btn_login.click
  end

end