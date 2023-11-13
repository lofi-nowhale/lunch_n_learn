require 'rails_helper'

RSpec.describe PlaceSerializer do
  it "returns a serialized recipe object within the serializer's format" do
    VCR.use_cassette("place_serializer") do
      places = PlaceFacade.new.tourist_sites("france")

      place = places.first

      serialized_place = PlaceSerializer.new(place).serializable_hash

      expect(serialized_place).to be_a Hash

      expect(serialized_place[:data]).to have_key(:id)
      expect(serialized_place[:data]).to have_key(:type)
      expect(serialized_place[:data]).to have_key(:attributes)

      expect(serialized_place).to_not have_key(:features)
      expect(serialized_place).to_not have_key(:properties)


      expect(serialized_place[:data][:attributes]).to have_key(:name)
      expect(serialized_place[:data][:attributes]).to have_key(:address)
      expect(serialized_place[:data][:attributes]).to have_key(:place_id)
    end
  end
end