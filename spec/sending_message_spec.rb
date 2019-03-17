require 'spec_helper'

RSpec.feature 'Sending message' do

  scenario 'user can send message to user from contact list' do

    HomePage.open
    HomePage.on do
      login_form('postmaster@sandbox768af69706e34c53bedd31dc58a43b68.mailgun.org',
              'yepl_user1')
    end
    Connections.open
    Connections.on do
      click_send_message
    end
    Connections.on do
      send_message("test_message")
    end
    Connections.on { is_expected.to have_confirmation_message_element }
  end

end
