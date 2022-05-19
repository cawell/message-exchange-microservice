class SessionsController < ApplicationController
  def create
    session = Session.call(user_params[:email], user_params[:password])

    render json: { token: session }, status: :ok

  rescue StandardError => e 
    render json: { error: e.message}, status: :unauthorized
  end


  def user_params
    params.require(:user).permit(:email, :password)
  end
end
