class PlaceService
  def conn
    Faraday.new(url: "https://api.geoapify.com") do |faraday|
      faraday.params["apiKey"] = Rails.application.credentials.place[:key]
      faraday.params["filter"] = 
    end
  end

  def get_url(url)
    response = conn.get(url)

    JSON.parse(response.body, symbolize_names: true)
  end
end