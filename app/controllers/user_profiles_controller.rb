class UserProfilesController < ApplicationController
  def show
    set_user
    @order_reviews = OrderReview.where(user_id: @user.id).order(created_at: :desc)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
