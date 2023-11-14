class Api::V1::LearningResourcesController < ApplicationController
  def index 
    @resource = LearningResourceFacade.new.learning_resource(params[:country])
    
    render json: LearningResourceSerializer.new(@resource)
  end
end