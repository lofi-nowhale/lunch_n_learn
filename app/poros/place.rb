class Place
  attr_reader :name, :address, :id
  def initialize(data)
    @name = data[:properties][:name]
    @address = data[:properties][:formatted]
    @id = data[:properties][:place_id]
  end
end