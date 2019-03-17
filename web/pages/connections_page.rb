require_relative 'home_page'

class Connections < HomePage
  path '/mynetwork/invite-connect/connections/'
  validate :url, %r{/mynetwork/invite-connect/connections/?\z}

  element :send_msg, :xpath, '//span[contains(text(),"Yevhen Plakhotnikov")]/../../../following-sibling::div[2]/div[1]/button'
  element :message_frame, :xpath, '//aside[@id="msg-overlay"]/div[2]'
  element :message_form, :xpath, '//form//div/p/..'
  element :send_btn, :xpath, '//aside//footer/div[2]/div[1]/button'
  element :confirmation_message, :xpath, '//li[@data-test-artdeco-toast-item-type = "success"]'

  def send_message(text)
    Howitzer::Log.info 'Fill form for sending message'
    message_form_element.set(text)
    send_btn_element.click
  end

  def click_send_message
    send_msg_element.click
  end

end
