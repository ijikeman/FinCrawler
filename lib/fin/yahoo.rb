require 'open-uri'
require 'nokogiri'

module Lib
  module Fin
    class Yahoo
      def current_price(code)
        url = 'http://info.finance.yahoo.co.jp/fx/detail/?code=USDJPY=FX'
        doc = Nokogiri::HTML(open(url))
        bid = doc.xpath("//*[@id='USDJPY_detail_bid']").text
        bid = doc.xpath("//*[@id='USDJPY_detail_ask']").text
        p bid
        p ask
      end
    end
  end
end
