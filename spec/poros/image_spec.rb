require 'rails_helper'

RSpec.describe Image do
  describe "#initialize" do
    it "creates an image object with readable attributes" do
      VCR.use_cassette("image_search_facade") do
        images = ImageFacade.new.get_images("laos")

        image = images.first

        expect(images.count).to eq 10

        expect(image).to be_an Image
        expect(image.alt_tag).to be_a String
        expect(image.url).to be_a String
      end
    end
  end
end