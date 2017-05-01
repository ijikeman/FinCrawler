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
          before_ratio = before_ratio.text.gsub(/(\,|\+)/, '').match(/\d+/)[0].to_i 
          before_ratio_mark = '+'
        else
          before_ratio = before_ratio.text.gsub(/(\,|\-)/, '').match(/\d+/)[0].to_i
          before_ratio_mark = '-'
        end
        p current_price
        p before_ratio_mark + before_ratio.to_s
      end

      private
      def url
        "#{BASE_URL}stocks/detail/?code=#{@code}"
      end
    end
  end
end
