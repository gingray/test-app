module NBP
  module API
    class Base
      HOST = 'api.nbp.pl'.freeze
      BASE_SEGMENT = '/api/exchangerates'.freeze
      DEFAULT_FORMAT = :json
      attr_accessor :url

      def initialize(args={})
        @format = args.fetch(:format, DEFAULT_FORMAT)
      end

      def get(url)
        response = Faraday.get url
        response.body
      end

      def build_url(segment)
        @format ||= DEFAULT_FORMAT
        segments = segment.split '/'
        segments.prepend BASE_SEGMENT
        path = segments.join '/'
        URI::HTTP.build host: HOST, path: path, query: "format=#{@format}"
      end
    end
  end
end