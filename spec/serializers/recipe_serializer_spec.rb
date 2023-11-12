require 'rails_helper'

RSpec.describe RecipeSerializer do
  it "returns a serialized recipe object within the serializer's format" do
    VCR.use_cassette("recipe_service_search_thailand") do
      recipes_returned = RecipeFacade.new.recipe_search("thailand")

      recipe = recipes_returned[0]

      serialized_recipe = RecipeSerializer.new(recipe).serializable_hash

      expect(serialized_recipe).to be_a Hash

      expect(serialized_recipe[:data]).to have_key(:id)
      expect(serialized_recipe[:data]).to have_key(:type)
      expect(serialized_recipe[:data]).to have_key(:attributes)

      expect(serialized_recipe).to_not have_key(:count)
      expect(serialized_recipe).to_not have_key(:hits)


      expect(serialized_recipe[:data][:attributes]).to have_key(:title)
      expect(serialized_recipe[:data][:attributes]).to have_key(:url)
      expect(serialized_recipe[:data][:attributes]).to have_key(:country)
      expect(serialized_recipe[:data][:attributes]).to have_key(:image)


    end
  end
end