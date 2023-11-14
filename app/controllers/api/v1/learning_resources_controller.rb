class Api::V1::LearningResourcesController < ApplicationController
  def index 
    @resource = LearningResourceFacade.new.learning_resource(country)
    
    render json: LearningResourcesSerializer.new(@resource)
  end
end