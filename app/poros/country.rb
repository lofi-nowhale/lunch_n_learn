class Country
  attr_reader :name, :capital, :latlng, :lon, :lat
  def initialize(data)
    @name = data[:name][:common]
    @capital = data[:capital][0]
    @latlng = data[:capitalInfo][:latlng]
    @lat = @latlng[0]
    @lon = @latlng[1]
  end
end