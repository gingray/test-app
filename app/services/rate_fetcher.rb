class RateFetcher

  def fetch
    rates = NBP::API::Rate.new
    data = rates.today
    value = JSON.parse data
    date = Time.parse(value['rates']&.first['effectiveDate'])
    day = Day.first_or_create! publish_date: date
  end
end
