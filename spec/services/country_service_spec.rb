require 'rails_helper'

RSpec.describe CountryService, type: :service do
  describe "#randomize" do
    it "can pull a random country from a list of all countries" do
      VCR.use_cassette("country_service_randomize") do 
        chosen_country = CountryService.new.random_country

        expect(chosen_country).to be_a Hash 
        expect(chosen_country).to have_key(:name)

        expect(chosen_country[:name]).to have_key(:common)
      end
    end
  end
end

