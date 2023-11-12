class Api::V1::RecipesController < ApplicationController
  def index
    @recipes = RecipeFacade.new.recipe_search(params[:country])
    render json: RecipeSerializer.new(@recipes)
  end
end