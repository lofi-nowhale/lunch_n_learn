class RecipeFacade
  def initialize
    @recipe = RecipeService.new
  end

  def recipe_search(country)
    data = @recipe.recipe_search(country)

    data[:hits].map do |recipe_data|
      Recipe.new(recipe_data, country)
    end
  end
end