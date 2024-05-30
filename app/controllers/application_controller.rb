class ApplicationController < ActionController::Base
  before_action :redirect_to_onboarding, if: -> { user_signed_in? && current_user.user_name.blank? }
  include ApplicationHelper

  before_action :configure_permitted_parameters, if: :devise_controller?
  def configure_permitted_parameters
    signup_keys = [:avatar, :name, :user_name, :birthdate, :bio, :uid, :provider]
    devise_parameter_sanitizer.permit(:sign_up, keys: signup_keys)
  end

  def redirect_to_onboarding
    return if controller_name == "onboardings"
    redirect_to new_onboarding_path
  end

  def previous_path
   @previous_path = Rails.application.routes.recognize_path(request.referrer)
  end

  def previous_controller_name
    previous_path[:controller]
  end
  helper_method :previous_controller_name

  def previous_action_name
    previous_path[:action]
  end
  helper_method :previous_action_name
end
