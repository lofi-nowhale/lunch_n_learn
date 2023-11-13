require 'rails_helper'

RSpec.describe Place do
  describe "initialize" do
    it "creates a Place Object" do
      VCR.use_cassette("place_poro") do
        places = PlaceFacade.new.tourist_sites("france")

        place = places.first

        expect(place.name).to be_a String
        expect(place.address).to be_a String
        expect(place.place_id).to be_a String
      end
    end
  end

end