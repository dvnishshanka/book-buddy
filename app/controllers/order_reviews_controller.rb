class OrderReviewsController < ApplicationController
  def new
    @order_review = OrderReview.new
    @order_review.order = set_order
    @order_reviews = OrderReview.where(user_id: set_order.book_copy.user_id).order(created_at: :desc)
  end

  def create
    @order_review = OrderReview.new(order_review_params)
    @order_review.order = set_order
    @order_review.user_id = set_order.book_copy.user_id
    # respond_to do |format|
      if @order_review.save
        redirect_to user_profile_path(@order_review.user_id)
      else
         render :new, status: :unprocessable_entity
      end
      # format.json
    # end
  end

  private

  def set_order
    @order = Order.find(params[:order_id])
  end

  def order_review_params
    params.require(:order_review).permit(:rating, :content)
  end

  def spin_words(sentence)

  end
end
