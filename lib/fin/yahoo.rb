module Lib
  module Fin
    class Yahoo

      BASE_URL = 'https://stocks.finance.yahoo.co.jp/'

      def self.search_url(code)
        "#{BASE_URL}stocks/detail/?code=#{code}"
      end

      def self.parse(code)
        Parser::parse(search_url(code))
      end

      def self.current_price(code)
        doc = parse(code)
        current_price = doc.xpath("//td[@class='stockPrice']").text
        before_ratio = doc.xpath("//span[@class='icoDownRed yjMSt']").text
        p current_price
        p before_ratio
      end
    end
  end
end
