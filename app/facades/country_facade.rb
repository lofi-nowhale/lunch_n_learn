class CountryFacade
  def initialize
    @country = CountryService.new
  end

  def random_country
    response = @country.random_country

    country = response.sample

    country[:name][:common]
  end
end