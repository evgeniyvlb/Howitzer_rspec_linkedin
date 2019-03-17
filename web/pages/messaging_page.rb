require_relative 'home_page'

class Messaging < HomePage
  path '/messaging/'
  validate :url, %r{/messaging/thread/\d+/\z}

  element :sender , :xpath, '(//span[@class = "visually-hidden" and contains(text(), "YeplUser YeplName")]/..)[1]'
  element :message_text , :xpath, '//p[contains(text(), "test_message")]'

  def select_sender
    sender_element.click
  end

end
