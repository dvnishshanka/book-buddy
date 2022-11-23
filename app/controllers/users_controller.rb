class UsersController < ApplicationController
  def user
    @user = current_user
  end

  def users_params
    params.require(:user).permit(:photo)
  end

end
