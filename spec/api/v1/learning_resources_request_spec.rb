require 'rails_helper'

RSpec.describe "Learning Resources Request" do
  it "provides a list of resources" do 
    WebMock.allow_net_connect! 
    WebMock.disable! 
    VCR.eject_cassette 
    VCR.turn_off!(:ignore_cassettes => true)

    get "/api/v1/learning_resources?country=laos"

    resources = JSON.parse(response.body, symbolize_names: true)

    expect(response).to have_http_status(:ok)
    expect(response.content_type).to eq('application/json; charset=utf-8')

    expect(resources[:data]).to have_key(:type)
    expect(resources[:data][:type]).to eq("learning_resource")

    expect(resources[:data]).to have_key(:attributes)
    expect(resources[:data][:attributes]).to have_key(:country)
    expect(resources[:data][:attributes]).to have_key(:video)
    expect(resources[:data][:attributes]).to have_key(:images)
  end
end