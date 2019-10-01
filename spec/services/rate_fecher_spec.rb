describe RateFetcher, vcr: true, focus: true do
  let(:service) { RateFetcher.new }
  it do
    expect(service.fetch).to eq 2
  end
end
