class OrdersController < ApplicationController
  before_action :set_book_copy, only: %i[new]

  def index
    # Scope your query to the dates being shown:
    start_date = params.fetch(:start_date, Date.today).to_date

    # For a monthly view:
    @orders = Order.where(book_copy_id: params[:book_copy_id]).where(start_date: (start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week))
    # Or, for a weekly view:
    # @orders = Meeting.where(starts_at: start_date.beginning_of_week..start_date.end_of_week)
  end

  def new
    @order = Order.new
    set_book_copy
  end

  def create
    @order = Order.new(order_params)
    @order.book_copy_id = set_book_copy.id
    @order.user_id = current_user.id
    @order.status = "ORDER_CREATED"
    if @order.save
      redirect_to book_copy_orders_path(@order.book_copy_id)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_book_copy
    @book_copy = BookCopy.find(params[:book_copy_id])
  end

  def order_params
    params.require(:order).permit(:start_date, :end_date)
  end
end
