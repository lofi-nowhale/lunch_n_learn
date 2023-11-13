class Api::V1::TouristSitesController < ApplicationController
  def index
    # country = CountryFacade.new.given_country(params[:country])
    # if country.capital == nil
    #   randomized_country = CountryFacade.new.random_country
    #   gen_places = PlaceFacade.new.tourist_sites(randomized_country)
    #   render json: PlaceSerializer.new(gen_places)
    # else
    #   @places = PlaceFacade.new.tourist_sites(params[:country])
    #   render json: PlaceSerializer.new(@places)
    # end
    
  @places = PlaceFacade.new.tourist_sites(params[:country])
  render json: PlaceSerializer.new(@places)
  end
end