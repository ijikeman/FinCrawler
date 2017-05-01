require 'open-uri'
require 'nokogiri'

class Parser
  def parse(url)
    Nokogiri::HTML(open(search_url(code)))
  end
end
