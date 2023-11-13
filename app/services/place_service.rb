class PlaceService
  def conn
    Faraday.new(url: "https://api.geoapify.com") do |faraday|
      faraday.params["apiKey"] = Rails.application.credentials.place[:key]
    end
  end

  def get_url(url)
    response = conn.get(url)

    JSON.parse(response.body, symbolize_names: true)
  end

  def tourist_sites(country)
    country1 = CountryFacade.new.given_country(country)
    get_url("/v2/places?categories=tourism.sights&filter=circle:#{country1.lon},#{country1.lat},10000")
  end
end