require 'rails_helper'

RSpec.describe Video do
  describe "#initialize" do
    it "creates a video object" do
      VCR.use_cassette("video_poro") do
        videos = VideoFacade.new.vids_by_country("laos")
  
        video = videos.first
      
        expect(video.youtube_video_id).to be_a String
        expect(video.title).to be_a String
      end
    end
  end
end