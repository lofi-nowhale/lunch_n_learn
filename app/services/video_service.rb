class VideoService 
  def conn
    Faraday.new(url: "https://www.googleapis.com") do |f|
      f.params["key"] = Rails.application.credentials.youtube[:key]
      f.params["channelId"] = "UCluQ5yInbeAkkeCndNnUhpw"
      f.params["type"] = "video"
      f.params["part"] = "snippet"
    end
  end

  def get_url(url)
    response = conn.get(url)

    JSON.parse(response.body, symbolize_names: true)
  end

  def vids_by_country(country)
    get_url("/youtube/v3/search?q=#{country}")

  end
end