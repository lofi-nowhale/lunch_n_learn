require 'rails_helper'

RSpec.describe Country do
  describe "initialize" do
    it "creates a Country Object" do
      VCR.use_cassette("country_poro") do
        country = CountryFacade.new.given_country("france")

        expect(country.capital).to be_a String
        expect(country.lat).to be_a Float
        expect(country.lon).to be_a Float
        expect(country.latlng).to be_an Array
        expect(country.name).to be_a String
      end
    end
  end

end