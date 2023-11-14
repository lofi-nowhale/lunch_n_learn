class LearningResource
  attr_reader :id, :video, :images, :country
  def initialize(video, images, country)
    @id 
    @video = {
      title: video.title,
      youtube_video_id: video.youtube_video_id
    }
    @images = images.map { |image| {alt_tag: image.alt_tag, url: image.url}}
    @country = country
  end
end