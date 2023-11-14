class ImageService 
  def conn
    Faraday.new(url: "https://api.unsplash.com") do |f|
      f.params["page"] = 1
      f.params["per_page"] = 10
      f.params["client_id"] = Rails.application.credentials.unsplash[:key]

    end
  end

  def get_url(url)
    response = conn.get(url)

    JSON.parse(response.body, symbolize_names: true)
  end

  def get_images(country)
    get_url("/search/photos?query=#{country}")
  end
end