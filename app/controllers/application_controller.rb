class ApplicationController < ActionController::API
  before_action :uptade_allowed_parameters, if: :devise_controller?

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password) }
  end

end
