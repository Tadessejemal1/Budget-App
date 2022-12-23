class ApplicationController < ActionController::Base
  rescue_from 'CanCan::AccessDenied' do |_exception|
    redirect_to root_path, alert: 'You are not authorized to access this page.'
  end

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!, except: [:index]

  def after_sign_in_path_for(_resource)
    categories_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(
      :sign_up,
      keys: %i[email name password password_confirmation]
    )
  end
end
