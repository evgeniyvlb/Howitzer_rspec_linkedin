require_relative 'advertisement_page'
# This class is example of web page
class HomePage < Howitzer::Web::Page
  path '/'
  validate :url, %r{\A(?:.*?:\/\/)?[^\/]*\/?[fed]*\/?\z}

  element :login_btn, '#login-submit'
  element :email_input, :xpath, '//input[@id="login-email"]'
  element :password_input, :xpath, '//input[@id="login-password"]'
  iframe :advertisement, :xpath, '(//iframe[@class="ad-banner"])[1]'
  element :complaint_window, :xpath, '//artdeco-modal-overlay/artdeco-modal'

  def login_form(email, password)
    Howitzer::Log.info 'Fill login form on Home page'
    email_input_element.set(email)
    password_input_element.set(password)
    login_btn_element.click
  end

end
