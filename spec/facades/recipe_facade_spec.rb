require 'rails_helper'

RSpec.describe RecipeFacade do
  describe "#recipe_search" do
    it "can return recipes related to the country search" do
      VCR.use_cassette("recipe_service_search_thailand") do
        recipes_returned = RecipeFacade.new.recipe_search("thailand")

        recipe = recipes_returned[0]

        expect(recipe.id).to eq(nil)
        expect(recipe.title).to be_a String
        expect(recipe.url).to be_a String
        expect(recipe.image).to be_a String
      end
    end
  end
end