module Lib
  module Parser
    class Yahoo < Lib::Parser
      BASE_URL = 'https://stocks.finance.yahoo.co.jp/'
      def parse
        doc = open
        current_price = doc.xpath("//td[@class='stoksPrice']").text
        before_ratio = doc.xpath("//span[@class='icoDownRed yjMSt']").text
        p current_price
        p before_ratio
      end

      private
      def url
        "#{BASE_URL}stocks/detail/?code=#{@code}"
      end
    end
  end
end
