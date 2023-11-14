class LearningResourceFacade
  def learning_resource(country)
    LearningResource.new(get_video(country), get_images(country), country)
  end

  def get_video(country)
    videos = VideoService.new.vids_by_country(country)
    if videos == nil
      {}
    else
      video = VideoFacade.new.vids_by_country(country)
    end
  end

  def get_images(country)
    images = ImageService.new.get_images(country)

    if images == nil
      []
    else
      image = ImageFacade.new.get_images(country)
    end
  end
end