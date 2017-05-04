class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :confirm_user_sign_in, only: [:index],unless: :user_signed_in?
  add_flash_types :success, :info, :warning, :danger

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def after_sign_out_path_for(resource)
    new_user_session_path
  end

  private
  def confirm_user_sign_in
    redirect_to new_user_session_path, notice: 'ログインしてください'
  end
end
