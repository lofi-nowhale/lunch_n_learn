# require 'rails_helper'

# RSpec.describe LearningResourceSerializer do
#   it "returns a serialized Learning Resource response with the serializers format" do
#     VCR.use_cassette("learning_resource_serializer") do
#       video = VideoFacade.new.vids_by_country("laos")
#       image = ImageFacade.new.get_images("laos")

#       serialized_learning_resource = LearningResourceSerializer.new(video, image).serializable_hash
#     end
#   end
# end