class OnboardingsController < ApplicationController
  skip_before_action :redirect_to_onboarding, only: [:new, :update]
  helper_method :resource_name, :resource, :devise_mapping
  layout "blank"

  def new
    resource = current_user || User.new
  end

  def update
    if resource.update(username_params)
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def username_params
    params.require(:user).permit(:user_name, :avatar, :birthdate, :bio)
  end

  def resource_name
    :user
  end
 
  def resource
    @resource = current_user
  end
 
  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
 
  def resource_class
    User
  end
end
