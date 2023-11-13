class PlaceFacade
  def initialize
    @place = PlaceService.new
  end

  def tourist_sites(country)
    data = @place.tourist_sites(country)
    
    data[:features].map do |site_data|
      Place.new(site_data)
    end
  end
end