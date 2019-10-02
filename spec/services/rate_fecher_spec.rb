describe RateRetriever, vcr: true do
  let(:service) { RateRetriever.new }
  let(:iso_code) { 'USD' }

  context 'retrieve today rates' do
    let(:expected_date) { Date.parse 'Tue, 02 Oct 2019' }
    before { service.retrieve(iso_code) }
    it do
      day = Day.first
      expect(day.publish_date).to eq expected_date
      expect(day.rates.count).to eq 1
    end
  end

  context 'retrieve date range rates', focus: true do
    let(:expected_date) { Date.parse 'Tue, 01 Oct 2019' }
    before { service.retrieve_range(iso_code, '2019-09-27', '2019-10-01') }
    it do
      expect(Day.count).to eq 3
    end
  end

end
