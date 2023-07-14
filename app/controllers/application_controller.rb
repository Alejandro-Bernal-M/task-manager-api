class ApplicationController < ActionController::API
  before_action :authenticate_request

  private

  def authenticate_request
    token = request.headers['Authorization'].split(' ').last
    begin
      payload = JWT.decode(token, Rails.application.secrets.secret_key_base, true, algorithm: 'HS256')
      @current_user = User.find(payload.first['user_id'])
    rescue JWT::DecodeError, ActiveRecord::RecordNotFound
      render json: { error: 'Unauthorized' }, status: :unauthorized
    end
  end
end
