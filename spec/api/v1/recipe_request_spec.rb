require 'rails_helper'

RSpec.describe "Recipes API" do
  it "sends a list of all recipes" do
    WebMock.allow_net_connect! 
    WebMock.disable! 
    VCR.eject_cassette 
    VCR.turn_off!(:ignore_cassettes => true)
    
    params = { country: "Thailand" }

    get '/api/v1/recipes', params: params

    expect(response).to be_successful 

    recipes = JSON.parse(response.body, symbolize_names: true)
  end
end