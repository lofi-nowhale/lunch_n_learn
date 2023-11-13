class CountryFacade
  def initialize
    @country = CountryService.new
  end

  def random_country
    response = @country.random_country

    response[:name][:common]
  end
end