require 'rails_helper'

RSpec.describe ImageService, type: :service do
  describe "#get_images" do
    it "can return 10 images related to the searched country" do
      VCR.use_cassette("image_search_service") do
        images = ImageService.new.get_images("laos")

        expect(images).to be_a Hash
        expect(images).to have_key(:results)
        expect(images[:results]).to be_an Array

        expect(images[:results].count).to eq 10

        expect(images[:results][0]).to have_key(:alt_description)
        expect(images[:results][0][:alt_description]).to be_a String

        expect(images[:results][0]).to have_key(:urls)
        expect(images[:results][0][:urls]).to have_key(:raw)
        expect(images[:results][0][:urls][:raw]).to be_a String
      end
    end
  end

end