class Api::V1::UsersController < ApplicationController
  def create
    if params[:password] == params[:password_confirmation]
      new_user = User.create!({
        name: params["name"],
        email: params["email"],
        api_key: SecureRandom.base64
      })
      render json: UserSerializer.new(new_user), status 201
    else


      
    end
    render json: UserSerializer.new(User.create(user_params))
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end