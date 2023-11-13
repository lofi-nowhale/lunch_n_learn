require 'rails_helper'

RSpec.describe PlaceService, type: :service do
  describe "#tourist_sites" do
    it "can pull a list of tourist sites withing a 10,000 meter radius of the passed in countrys capital lat and longitude" do
      VCR.use_cassette("tourist_sites_service") do 
        sites = PlaceService.new.tourist_sites("france")

        expect(sites).to be_an Hash
        expect(sites).to have_key(:type)
        expect(sites).to have_key(:features)

        expect(sites[:features][0]).to have_key(:type)
        expect(sites[:features][0]).to have_key(:properties)
        expect(sites[:features][0][:properties]).to have_key(:name)
        expect(sites[:features][0][:properties]).to have_key(:formatted)
        expect(sites[:features][0][:properties]).to have_key(:place_id)
  
      end
    end
  end
end 