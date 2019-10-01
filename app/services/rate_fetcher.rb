class RateFetcher
  BASE_URL = 'http://api.nbp.pl/api/exchangerates/'.freeze

  def fetch
    response = Faraday.get BASE_URL + 'rates/a/chf/?format=json'
    JSON.parse response.body
  end

end