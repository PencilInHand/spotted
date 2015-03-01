class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    registration_params = [:name, :email, :password, :password_confirmation]

    if params[:action] == 'update'
      devise_parameter_sanitizer.for(:account_update) { |update_params|
        update_params.permit(registration_params << :current_password)
      }
    elsif
      devise_parameter_sanitizer.for(:sign_up) { |sign_up_params|
        sign_up_params.permit(registration_params)
      }
    end
  end
end
