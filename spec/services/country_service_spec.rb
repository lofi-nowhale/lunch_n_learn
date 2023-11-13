require 'rails_helper'

RSpec.describe CountryService, type: :service do
  describe "#randomize" do
    it "can pull a random country from a list of all countries" do
      VCR.use_cassette("country_service_randomize") do 
        chosen_country = CountryService.new.random_country

        expect(chosen_country).to be_an Array
        expect(chosen_country[0]).to have_key(:name)
      
        expect(chosen_country[0][:name]).to have_key(:common)
      end
    end
  end

  describe "#given_country" do
    it "can pull a country from a users input" do
      VCR.use_cassette("country_search_service") do
        country = CountryService.new.given_country("france")

        expect(country).to be_an Array
        expect(country[0]).to have_key(:name)
        expect(country[0]).to have_key(:capital)
      end
    end
  end
end

