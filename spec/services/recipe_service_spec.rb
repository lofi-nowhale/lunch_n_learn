require 'rails_helper'

RSpec.describe RecipeService, type: :service do
  describe "search by country country" do
    it "can search by country" do
      VCR.use_cassette("recipe_service_search_thailand") do 
        recipes_returned = RecipeService.new.recipe_search("thailand")
        
        expect(recipes_returned).to be_a Hash 
        expect(recipes_returned[:hits]).to be_an Array
        expect(recipes_returned[:hits][0][:recipe]).to be_a Hash
      end
    end
  end
end

