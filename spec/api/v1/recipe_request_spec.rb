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

    expect(response).to have_http_status(:ok)
    expect(response.content_type).to eq('application/json; charset=utf-8')
    expect(recipes[:data][0][:attributes]).to have_key(:title)
    expect(recipes[:data][0][:attributes][:title]).to be_a String
  end

  it "sends a list of all recipes based off of a randomized country" do
    WebMock.allow_net_connect! 
    WebMock.disable! 
    VCR.eject_cassette 
    VCR.turn_off!(:ignore_cassettes => true)

    get "/api/v1/recipes?country=random"

    expect(response).to be_successful

    recipes = JSON.parse(response.body, symbolize_names: true)

    expect(response).to have_http_status(:ok)
    expect(response.content_type).to eq('application/json; charset=utf-8')
    expect(recipes[:data][0][:attributes]).to have_key(:title)
    expect(recipes[:data][0][:attributes][:title]).to be_a String
  end
end