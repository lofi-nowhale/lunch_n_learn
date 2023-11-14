class LearningResource
  attr_reader :id, :video, :images, :country
  def initialize(video, images, country)
    @id 
    @video = format_video(video)
    @images = images.map { |image| {alt_tag: image.alt_tag, url: image.url}}
    @country = country
  end

  def format_video(video)
    if video == {}
     {}
    else
      {
      title: video.title,
      youtube_video_id: video.youtube_video_id
    }
    end

  end
end