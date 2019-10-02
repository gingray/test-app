class DailyRates
  include Sidekiq::Worker

  def perform
    rate_retriever = RateRetriever.new
    [RateRetriever::ISO_USD, RateRetriever::ISO_EUR].each do |iso_code|
      rate_retriever.retrieve iso_code
    end
  end
end
