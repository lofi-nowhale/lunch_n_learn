class Api::V1::UsersController < ApplicationController
  def create
    if params[:password] == params[:password_confirmation]
      begin 
        new_user = User.create!({
          name: params["name"],
          email: params["email"],
          password: params["password"],
          api_key: SecureRandom.urlsafe_base64
        })
        render json: UserSerializer.new(new_user), status: 201
      rescue ActiveRecord::RecordInvalid => exception
        render json: ErrorSerializer.new(ErrorMessage.new(exception.message, 400)).serialize_json, status: 400
      end 
    else
      render json: ErrorSerializer.new(ErrorMessage.new("Please check your password/password confirmation and try again.", 400)).serialize_json, status: 400    
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end