class VideoFacade
  def initialize
    @video = VideoService.new
  end

  def vids_by_country(country)
    data = @video.vids_by_country(country)

    video_objects = data[:items].map do |video_data|
      Video.new(video_data)
    end

    video = video_objects.first
  end
end