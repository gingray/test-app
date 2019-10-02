class RateFetcher

  def fetch
    rates = NBP::API::Rate.new
    data = rates.today
    JSON.parse data
  end

end