require 'rails_helper'

RSpec.describe PlaceFacade do
  describe "#tourist_sites" do
    it "returns a list of tourist sites for that countrys capital" do
      VCR.use_cassette("place_facade_search") do
        site = PlaceFacade.new.tourist_sites("france")

        require 'pry';binding.pry

        expect(country).to be_a String
      end
    end
  end
end