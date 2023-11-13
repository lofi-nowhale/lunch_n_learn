class Api::V1::RecipesController < ApplicationController
  def index
    if params[:country] == "random"
      randomized_country = CountryFacade.new.random_country
      recipes = RecipeFacade.new.recipe_search(randomized_country)
      render json: RecipeSerializer.new(recipes)
    else
      @recipes = RecipeFacade.new.recipe_search(params[:country])
      render json: RecipeSerializer.new(@recipes)
    end
  end
end