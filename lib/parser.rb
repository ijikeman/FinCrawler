require 'open-uri'
require 'nokogiri'

class Parser
  def self.parse(url)
    Nokogiri::HTML(open(url))
  end
end
