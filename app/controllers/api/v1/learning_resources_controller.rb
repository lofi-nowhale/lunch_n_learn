class Api::V1::LearningResourcesController < ApplicationController
  def index 
    @video = VideoFacade.new.vids_by_country(country)
    @image = ImageFacade.new.get_images(country)
    render json: LearningResourcesSerializer.new(@video, @image)
    require 'pry';binding.pry
  end
end