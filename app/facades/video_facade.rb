class VideoFacade
  def initialize
    @video = VideoService.new
  end

  def vids_by_country(country)
    data = @video.vids_by_country(country)


    data[:items].map do |video_data|
      Video.new(video_data, country)
    end
  end
end