require 'rails_helper'

RSpec.describe "Log In User Request" do
  describe "happy path" do
    it "can log a user in" do
      WebMock.allow_net_connect! 
      WebMock.disable! 
      VCR.eject_cassette 
      VCR.turn_off!(:ignore_cassettes => true)
      user = User.create(name: "Gimli", email: "andmyaxe@test.com", password: "password", password_confirmation: "password", api_key: "jgn983hy48thw9begh98h4539h4")
  
      user_params = {
        email: "andmyaxe@test.com", 
        password: "password"
      }
  
      post "/api/v1/sessions", params: user_params, as: :json
  
      expect(response).to have_http_status(201)
  
      parsed_user = JSON.parse(response.body, symbolize_names: true)
  
      expect(parsed_user[:data]).to have_key(:type)
      expect(parsed_user[:data][:type]).to eq("user")
      expect(parsed_user[:data]).to have_key(:id)
      expect(parsed_user[:data]).to have_key(:attributes)
      expect(parsed_user[:data][:attributes][:name]).to eq("Gimli")
      expect(parsed_user[:data][:attributes][:email]).to eq("andmyaxe@test.com")
      expect(parsed_user[:data][:attributes][:api_key]).to be_a String
      expect(parsed_user[:data][:attributes]).to_not have_key(:password)
    end
  end

  describe "sad path" do 
    it "throws a 400 error if the email doesn't exist/ is invalid" do 
      user = User.create(name: "Gimli", email: "andmyaxe@test.com", password: "password", password_confirmation: "password")
  
      user_params = {
        email: "thering@test.com", 
        password: "password"
      }

      post "/api/v1/sessions", params: user_params, as: :json
  
      expect(response).to have_http_status(401)
  
      parsed_user = JSON.parse(response.body, symbolize_names: true)
  
      expect(parsed_user[:error]).to eq("Invalid credentials. Please try again.")

    end

    it "also throws an error... the same error, if the password is wrong for safety" do
      user = User.create(name: "Gimli", email: "andmyaxe@test.com", password: "password", password_confirmation: "password")
  
      user_params = {
        email: "andmyaxe@test.com", 
        password: "idkmypassword"
      }

      post "/api/v1/sessions", params: user_params, as: :json
  
      expect(response).to have_http_status(401)
  
      parsed_user = JSON.parse(response.body, symbolize_names: true)
  
      expect(parsed_user[:error]).to eq("Invalid credentials. Please try again.")
    end
  end
end