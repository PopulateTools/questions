class UsersController < ApplicationController
  def update
    @user = current_user
    @user.update_attributes(user_params)
  end

  private

  def user_params
    params.require(:user).permit(:email)
  end
end
