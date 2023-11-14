require 'rails_helper'

RSpec.describe VideoService, type: :service do
  describe "#vids_by_country" do
    it "returns a video related to the searched country" do
      VCR.use_cassette("video_service_search") do
        videos_returned = VideoService.new.vids_by_country("france") do
          
        expect(videos_returned).to be_a Hash
        expect(videos_returned).to have_key(:kind)
        expect(videos_returned).to have_key(:items)
        
        expect(videos_returned[:items][0]).to have_key(:id)
        expect(videos_returned[:items][0][:id]).to have_key(:videoId)

        expect(videos_returned[:items][0]).to have_key(:snippet)
        expect(videos_returned[:items][0][:snippet]).to have_key(:title)
        end
      end
    end
  end
end