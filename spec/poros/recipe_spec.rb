require 'rails_helper'

RSpec.describe Recipe do
  describe "initialize" do
    it "creates a Recipe Object" do
      VCR.use_cassette("recipe_poro") do
        recipes_returned = RecipeFacade.new.recipe_search("thailand")

        recipe = recipes_returned[0]

        expect(recipe.id).to eq(nil)
        expect(recipe.title).to be_a String
        expect(recipe.url).to be_a String
        expect(recipe.image).to be_a String
        expect(recipe.country).to be_a String
      end
    end
  end

end