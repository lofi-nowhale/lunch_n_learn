require 'rails_helper' 

RSpec.describe "Create User Request" do 
  it "can create a user" do
    WebMock.allow_net_connect! 
    WebMock.disable! 
    VCR.eject_cassette 
    VCR.turn_off!(:ignore_cassettes => true)

    user = {
      "name": "Odell",
      "email": "goodboy@ruffruff.com",
      "password": "treats4lyf",
      "password_confirmation": "treats4lyf"
    }

    post "/api/v1/users", params: user, as: :json

    user = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(response.content_type).to eq('application/json; charset=utf-8')

    expect(user[:data]).to have_key(:type)
    expect(user[:data][:type]).to eq("user")
    expect(user[:data]).to have_key(:id)
    expect(user[:data]).to have_key(:attributes)
    expect(user[:data][:attributes][:name]).to eq("Odell")
    expect(user[:data][:attributes][:email]).to eq("goodboy@ruffruff.com")
    expect(user[:data][:attributes][:api_key]).to be_a String
    expect(user[:data][:attributes]).to_not have_key(:password)
  end
end