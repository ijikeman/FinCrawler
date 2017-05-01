module Lib
  require 'open-uri'
  require 'nokogiri'

  class Parser
    def initialize(code)
      @code = code
    end

    def parse
      doc = nokogiri_open
    end

    private
    def url
      'http://'
    end

    def nokogiri_open
      Nokogiri::HTML(open(url))
    end
  end
end
