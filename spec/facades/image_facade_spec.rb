require 'rails_helper'

RSpec.describe ImageFacade do
  describe "#get_images" do
    it "can return a list of 10 images" do
      VCR.use_cassette("image_search_facade") do
        images = ImageFacade.new.get_images("laos")

        image = images.first

        expect(images.count).to eq 10

        expect(image).to be_an Image
      end
    end
  end
end