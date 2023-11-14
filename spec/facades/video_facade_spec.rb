require 'rails_helper'

RSpec.describe VideoFacade do
  describe "#vids_by_country" do
    it "returns a video related to that country" do
      VCR.use_cassette("vids_by_country_facade") do
        video = VideoFacade.new.vids_by_country("laos")
      
        expect(video.youtube_video_id).to be_a String
        expect(video.title).to be_a String
      end
    end
  end
end