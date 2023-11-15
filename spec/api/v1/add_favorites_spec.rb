# require 'rails_helper'

# RSpec.describe "Add a favorite for a user" do
#   describe "happy path - valid api key" do
#     it "can add a favorite for a user if their api key is valid" do
#       WebMock.allow_net_connect! 
#       WebMock.disable! 
#       VCR.eject_cassette 
#       VCR.turn_off!(:ignore_cassettes => true)
#       user = User.create(name: "Gimli", email: "andmyaxe@test.com", password: "password", password_confirmation: "password", api_key: "jgn983hy48thw9begh98h4539h4")
  
#       recipe_params = {
#         "api_key": "jgn983hy48thw9begh98h4539h4",
#         "country": "thailand",
#         "recipe_link": "https://www.tastingtable.com/.....",
#         "recipe_title": "Crab Fried Rice (Khaao Pad Bpu)"
#         }
      
#       post "/api/v1/favorites" params: recipe_params, as: :json

#       expect(response).to have_http_status(201)
      
#       added_recipe = JSON.parse(response.body, symbolize_names: true)

#       require 'pry';binding.pry

#     end
#   end
# end