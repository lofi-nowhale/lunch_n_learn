require 'rails_helper'

RSpec.describe LearningResourceFacade do
  describe "#get_video" do
    describe "happy path" do
      it "returns a video object" do
        VCR.use_cassette("learning_resource_vids_facade") do 
          video = LearningResourceFacade.new.get_video("laos")

          expect(video).to be_a Video

          expect(video.youtube_video_id).to be_a String
          expect(video.title).to be_a String
        end
      end
    end

    describe "sad path" do
      it "returns an empty hash if there are no videos for that specific country" do
        VCR.use_cassette("learning_resource_vids_sad") do
          video = LearningResourceFacade.new.get_video("fakecountry")
          expect(video).to eq({})
        end
      end
    end
  end

  describe "#get_images" do
    describe "happy path" do
      it "returns a list of 10 image objects" do
        VCR.use_cassette("learning_resource_images_happy") do
          images = LearningResourceFacade.new.get_images("laos")

          expect(images).to be_an Array

          image = images.first

          expect(image).to be_an Image
          expect(image.alt_tag).to be_a String
          expect(image.url).to be_a String
        end

      end
    end

    describe "sad path" do
      it "returns an empty array when no images are found" do
        VCR.use_cassette("learning_resource_image_sad") do
          images = LearningResourceFacade.new.get_images("asdfasdf")

          expect(images).to be_an Array
          expect(images).to eq([])
          expect(images.count).to eq 0
        end
      end
    end
  end

  describe "#learning_resource" do
    describe "happy path - where country has videos and images" do
      it "creates a new learning resource with video and images" do
        VCR.use_cassette("learning_resource_resource_happy") do 
          resource = LearningResourceFacade.new.learning_resource("laos")
  
          expect(resource).to be_a LearningResource

        end
      end
    end
  end
end