require 'open-uri'
require 'nokogiri'

module Lib
  module Fin
    class Yahoo
      def self.current_price(code)
        url = "https://stocks.finance.yahoo.co.jp/stocks/detail/?code=#{code}.T"
        doc = Nokogiri::HTML(open(url))
        p doc
        bid = doc.xpath("//*[@id='stoksPrice']").text
        p bid
      end
    end
  end
end
