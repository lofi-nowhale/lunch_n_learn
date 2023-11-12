# since passing country in facade we should have access to country here. 
class Recipe
  attr_reader :id, :title, :url, :image, :country
  def initialize(data, country)
    @id = nil
    @title = data[:recipe][:label]
    @url = data[:recipe][:url]
    @image = data[:recipe][:image]
    @country = country
  end


end