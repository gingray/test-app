module NBP
  module API
    class BaseError < StandardError
      def initialize(url, response)
        super("url: #{url} code: #{response.status} body: #{response.body}")
      end
    end

    class Base
      HOST = 'api.nbp.pl'.freeze
      BASE_SEGMENT = '/api/exchangerates'.freeze
      FORMAT_JSON = :json
      SUCCESS_CODE = 200
      MAX_DAYS = 93
      attr_accessor :url, :format

      def initialize(args={})
        @format = args.fetch(:format, FORMAT_JSON)
      end

      def get(url)
        response = Faraday.get url
        raise BaseError.new(url, response) if response.status != SUCCESS_CODE

        parse_response response.body
      end

      def build_url(segment)
        @format ||= FORMAT_JSON
        segments = segment.split '/'
        segments.prepend BASE_SEGMENT
        path = segments.join '/'
        URI::HTTP.build host: HOST, path: path, query: "format=#{format}"
      end

      def convert_date(date)
        val = nil
        val = date if date.respond_to?(:strftime)

        val = Date.parse(date) if date.is_a? String

        raise ArgumentError, "wrong argument #{date}" unless val
        val.strftime('%Y-%m-%d')
      end

      def parse_response(body)
        return JSON.parse(body) if format == FORMAT_JSON
        body
      end
    end
  end
end
