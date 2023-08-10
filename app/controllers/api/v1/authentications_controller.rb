class Api::V1::AuthenticationsController < ApplicationController
  skip_before_action :authenticate_request, only: [:login]

  def login
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      expiration_time = 2.hours.from_now.to_i
      token = JWT.encode({user_id: user.id, exp: expiration_time }, Rails.application.secrets.secret_key_base, 'HS256')
      render json: {status: 'Sucess', token: token, user_id: user.id}
    else
      render json: {status: 'Error', message: 'Invalid username or password'}
    end
  end
end