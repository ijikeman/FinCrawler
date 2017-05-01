module Lib
  class Parser
    class Yahoo < Lib::Parser
      BASE_URL = 'https://stocks.finance.yahoo.co.jp/'
      def parse
        doc = nokogiri_open
        current_price = doc.xpath("//td[@class='stoksPrice']").text.delete(',').to_i
        yesterday_price = doc.xpath("//div[@class='lineFi clearfix']").xpath("//dl[@class='tseDtlDelay']").xpath("dd[@class='ymuiEditLink mar0']").xpath('strong')[0].text.delete(',').to_i

        today_start_price = today_high_price = today_low_price = nil
        doc.xpath("//div[@class='lineFi clearfix']").xpath("//dl[@class='tseDtl']").xpath("dd[@class='ymuiEditLink mar0']").xpath('strong').each_with_index {|current_data, index|
          case index
          when 0
            today_start_price = current_data.text.delete(',').to_i
          when 1
            today_high_price = current_data.text.delete(',').to_i
          when 2
            today_low_price = current_data.text.delete(',').to_i
          end
        }
        p current_price
        p yesterday_price
        p today_start_price
        p today_high_price
        p today_low_price
        p current_price - yesterday_price
        p (((current_price - yesterday_price) * 100).to_f / current_price).round(2)
      end

      private
      def url
        "#{BASE_URL}stocks/detail/?code=#{@code}"
      end
    end
  end
end
