class UserProfilesController < ApplicationController
  def show
    set_user
    @order_review = OrderReview.new
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
