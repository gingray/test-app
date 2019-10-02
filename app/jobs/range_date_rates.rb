class RangeDateRates
  include Sidekiq::Worker

  def perform(iso_code, start_date, end_date)
    return unless [RateRetriever::ISO_USD, RateRetriever::ISO_EUR].include? iso_code

    rate_retriever = RateRetriever.new
    rate_retriever.retrieve_range iso_code, start_date, end_date
  rescue ::NBP::API::BaseError => e
    logger.error e.message
  end
end
