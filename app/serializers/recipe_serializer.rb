class RecipeSerializer 
include JSONAPI::Serializer
  attributes :title, :url, :country, :image

  # set_type :recipes the serializer gem is going to set this automatically based on the object that its serializing

  # set_id :id the serializer gem is going to set this automatically
end