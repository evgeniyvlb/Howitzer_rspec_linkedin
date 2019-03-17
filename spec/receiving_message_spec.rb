require 'spec_helper'

RSpec.feature 'Receiving message' do

  scenario 'user can open received message' do

    HomePage.open
    HomePage.on do
      login_form('postmaster@sandbox999af69706e34c53bedd31dc58a43b68.mailgun.org',
               'yepl_user2')
    end
    Messaging.open
    Messaging.on do
      select_sender
    end
    Messaging.on { is_expected.to have_message_text_element }
  end

end
