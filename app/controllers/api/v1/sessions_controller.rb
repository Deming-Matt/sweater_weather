class Api::V1::SessionsController < ApplicationController

  def create
    user = User.find_by(email: params[:email])
    if user.authenticate(params[:password])
      session[:user_id] = user.id
      render json: UserSerializer.new(user), status: 200
    else
      render json: { error: "Bad Credentials"}, status: 401
    end
  end

  private
    def sessions_params
      params.permit(:email, :password)
    end
end
