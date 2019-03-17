require_relative 'home_page'

class MyNetwork < HomePage
  path '/mynetwork/'
  validate :url, %r{/mynetwork/?\z}

  element :contacts, '#ember548'
end
