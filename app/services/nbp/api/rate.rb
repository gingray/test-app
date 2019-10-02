module NBP
  module API
    class Rate < Base
      BASE_SEGMENT = 'rates'.freeze

      def today(currency_code)
        url = build_url [BASE_SEGMENT, 'a', currency_code].join('/')
        get url
      end

      def date_range(currency_code, start_date, end_date)
        url = build_url [BASE_SEGMENT, 'a', currency_code, convert_date(start_date), convert_date(end_date)].join('/')
        get url
      end
    end
  end
end
