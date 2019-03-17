#require_relative 'home_page'

class AdvertisementPage < Howitzer::Web::Page
  path 'https://www.linkedin.com/tscp-serving/dtag?sz=1x1&ti=1&p=1&c=1&z=home&pk=d_flagship3_feed&p
z=H'
  validate :url, %r{https:\/\/www.linkedin.com\/tscp-serving\/dtag[?a-zA-Z=&_0-9\s]*}

  element :triple_btn, :xpath, '//div[@class= "ac ac--inline "]'
  element :varriable_advertisement_btn, :xpath, '//div[@class="ac__container"]/a[1]//div[@class="ac__tooltip-title"]'

  def open_complaint_window
    Howitzer::Log.info 'Openning complaint dvertisement window'
    triple_btn_element.click
    varriable_advertisement_btn_element.click
  end

end
