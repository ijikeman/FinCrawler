require 'open-uri'
require 'nokogiri'

class Parser
  def initialize(code)
    @code = code
  end

  def parse
    doc = open
  end

  private
  def url
    'http://'
  end

  def open
    Nokogiri::HTML(open(url))
  end
end
