describe RateRetriever, vcr: true, focus: true do
  let(:service) { RateRetriever.new }
  let(:iso_code) { 'USD' }
  it do
    expect(service.retrieve(iso_code)).to eq 2
  end
end
