require 'rails_helper'

RSpec.describe CountryFacade do
  describe "#radom_country" do
    it "returns the common name of a randomly selected country" do
      VCR.use_cassette("country_facade_random_select") do
        country = CountryFacade.new.random_country

        expect(country).to be_a String
      end
    end
  end
end