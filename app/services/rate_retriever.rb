class RateRetriever

  def retrieve(iso_code)
    rates = NBP::API::Rate.new
    data = rates.today(iso_code)
    date = Time.parse(data['rates']&.first['effectiveDate'])
    day = Day.first_or_create! publish_date: date
  end

  def fetch_rate

  end

  def save

  end

end
