module NBP
  module API
    class Rate < Base
      BASE_SEGMENT = 'rates'.freeze

      def today(currency_code = 'USD')
        url = build_url [BASE_SEGMENT, 'a', currency_code].join('/')
        get url
      end

      def within_range(currency_code = 'USD', start_date, end_date)
        url = build_url [BASE_SEGMENT, 'a', currency_code].join('/')
        get url
      end
    end
  end
end
