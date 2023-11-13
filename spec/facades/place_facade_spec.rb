require 'rails_helper'

RSpec.describe PlaceFacade do
  describe "#tourist_sites" do
    it "returns a list of tourist sites for that countrys capital" do
      VCR.use_cassette("place_facade_search") do
        sites = PlaceFacade.new.tourist_sites("france")

        expect(sites).to be_an Array

        site = sites.first

        expect(site).to be_a Place
        expect(site.address).to be_a String
        expect(site.id).to eq(nil)
        expect(site.name).to be_a String
        expect(site.place_id).to be_a String
      end
    end
  end
end