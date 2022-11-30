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
    respond_to do |format|
      if @order_review.save
        format.html { redirect_to new_book_copy_order_order_review_path(@order_review.order) }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
      format.json
    end
  end

  private

  def set_order
    @order = Order.find(params[:order_id])
  end

  def order_review_params
    params.require(:order_review).permit(:rating, :content)
  end
end
