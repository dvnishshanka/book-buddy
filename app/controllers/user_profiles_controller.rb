class UserProfilesController < ApplicationController
  def show
    set_user
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
