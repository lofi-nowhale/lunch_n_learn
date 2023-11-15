class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: user_params[:email])
    if user
      if user.authenticate(user_params[:password])
        render json: UserSerializer.new(user), status: 201
      else 
        render json: { error: "Invalid credentials. Please try again."}, status: 401
      end
    else
      render json: { error: "Invalid credentials. Please try again."}, status: 401
    end
  end

  private
  
  def user_params
    params.permit(:name, :email, :password)
  end
end