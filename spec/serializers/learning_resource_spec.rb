require 'rails_helper'

RSpec.describe LearningResourceSerializer do
  it "returns a serialized Learning Resource response with the serializers format" do
    VCR.use_cassette("learning_resource_serializer") do
      resource = LearningResourceFacade.new.learning_resource("laos")

      serialized_learning_resource = LearningResourceSerializer.new(resource).serializable_hash

      expect(serialized_learning_resource).to be_a Hash
      expect(serialized_learning_resource).to have_key(:data)

      expect(serialized_learning_resource).to_not have_key(:count)
      expect(serialized_learning_resource).to_not have_key(:hits)
      expect(serialized_learning_resource).to_not have_key(:total_pages)
      
      expect(serialized_learning_resource[:data]).to have_key(:id)
      expect(serialized_learning_resource[:data]).to have_key(:type)
      expect(serialized_learning_resource[:data][:type]).to eq(:learning_resource)

      expect(serialized_learning_resource[:data]).to have_key(:attributes)
      expect(serialized_learning_resource[:data][:attributes]).to have_key(:country)
      expect(serialized_learning_resource[:data][:attributes][:country]).to eq("laos")
      
      expect(serialized_learning_resource[:data][:attributes]).to have_key(:video)
      expect(serialized_learning_resource[:data][:attributes][:video]).to have_key(:title)
      expect(serialized_learning_resource[:data][:attributes][:video][:title]).to be_a String
      expect(serialized_learning_resource[:data][:attributes][:video]).to have_key(:youtube_video_id)
      expect(serialized_learning_resource[:data][:attributes][:video][:youtube_video_id]).to be_a String
      
      expect(serialized_learning_resource[:data][:attributes]).to have_key(:images)
      expect(serialized_learning_resource[:data][:attributes][:images]).to be_an Array
      expect(serialized_learning_resource[:data][:attributes][:images][0]).to have_key(:alt_tag)
      expect(serialized_learning_resource[:data][:attributes][:images][0][:alt_tag]).to be_a String
      expect(serialized_learning_resource[:data][:attributes][:images][0]).to have_key(:url)
      expect(serialized_learning_resource[:data][:attributes][:images][0][:url]).to be_a String
    end
  end
end