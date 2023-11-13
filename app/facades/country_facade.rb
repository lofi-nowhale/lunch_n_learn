class CountryFacade
  def initialize
    @country = CountryService.new
  end

  def random_country
    response = @country.random_country

    country = response.sample

    country[:name][:common]
  end

  def given_country(country)
    data = @country.given_country(country)
    country = Country.new(data.first)
  end
end