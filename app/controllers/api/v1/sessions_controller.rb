class Api::V1::SessionsController < ApplicationController
  # POST /api/v1/login
  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      render json: { status: :created, logged_in: true, user: user }
    else
      render json: { status: 401, logged_in: false, message: 'Unauthorized' }
    end
  end

  # DELETE /api/v1/logout
  def destroy
    reset_session
    render json: { status: 200, logged_in: false }
  end
end