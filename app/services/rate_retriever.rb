class RateRetriever
  ISO_USD = 'USD'.freeze
  ISO_EUR = 'EUR'.freeze

  def retrieve(iso_code)
    rates = NBP::API::Rate.new
    data = rates.today(iso_code)
    save_data data
  end

  def retrieve_range(iso_code, date_start, date_finish)
    rates = NBP::API::Rate.new
    data = rates.date_range(iso_code, date_start, date_finish)
    save_data data
  end

  def save_data(data)
    currency_name = data['currency']
    data['rates'].each do |item|
      date = Time.parse(item['effectiveDate'])
      day = Day.find_or_create_by! publish_date: date
      rate = day.rates.where(iso_code: data['code']).first
      next if rate

      day.rates.build(iso_code: data['code'], name: currency_name, currency_rate: item['mid'])
      day.save!
    end
  end
end
