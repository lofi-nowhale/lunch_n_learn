class CountryService
  def conn 
    Faraday.new(url: "https://restcountries.com/")
  end

  def get_url(url)
    response = conn.get(url)

    JSON.parse(response.body, symbolize_names: true)
  end

  def random_country
    all_countries = get_url("/v3.1/all")
  end

  def given_country(country)
    get_url("/v3.1/name/#{country}")
  end

end