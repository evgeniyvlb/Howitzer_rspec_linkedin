require 'spec_helper'

RSpec.feature 'Closing advertisement' do

  scenario 'user can close advertisement' do
    HomePage.open
    HomePage.on do
      login_form('postmaster@sandbox768af69706e34c53bedd31dc58a43b68.mailgun.org',
               'yepl_user1')
    end
    HomePage.on { is_expected.to have_advertisement_iframe }
    HomePage.on do
      advertisement_iframe do |frame|
        frame.open_complaint_window
      end
    end
      HomePage.on { is_expected.to have_complaint_window_element }
  end

end
