class Page < ApplicationRecord
  require 'open-uri'
  has_many :elements, dependent: :destroy

  def read_html
    page = Nokogiri::HTML.parse(open(self.weburl))
		["h1", "h2", "h3", "a"].each do |tag|
			page.css(tag).each do |element|
				if tag != "a"
					self.elements.create(title: tag, content: element.content)
				else
					self.elements.create(title: tag, content: element['href'])
				end
			end
		end  
  end

end
