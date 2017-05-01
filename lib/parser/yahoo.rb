module Lib
  class Parser
    class Yahoo < Lib::Parser
      BASE_URL = 'https://stocks.finance.yahoo.co.jp/'
      def parse
        doc = nokogiri_open
        current_price = doc.xpath("//td[@class='stoksPrice']").text.delete(',').to_i
        before_ratio = doc.xpath("//span[@class='icoDownRed yjMSt']")
        if before_ratio.empty? == true
          before_ratio = doc.xpath("//span[@class='icoUpGreen yjMSt']")
        end
        before_ratio = before_ratio.text.delete(',').match(/(\+|\-)\d+/)[0]
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
