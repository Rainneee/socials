class ProfileController < ApplicationController
  before_action :authenticate_user!

  def show
  end

  def update
    if current_user.update_without_password(user_params)
      redirect_to profile_path, notice: "Updated Profile"
    else
      errors = current_user.errors.full_messages.join(', ')
      redirect_to profile_path, alert: "Profile update failed: #{errors}"
    end
  end

  private

  def user_params
    params.require(:user).permit(:user_name, :avatar, :birthdate, :bio)
  end
end
