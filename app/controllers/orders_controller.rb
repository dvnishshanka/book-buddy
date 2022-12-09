class OrdersController < ApplicationController
  before_action :set_book_copy, only: %i[new]

    skip_before_action :verify_authenticity_token, :only => [:update, :accept, :reject]

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
    set_previous_order_dates
  end

  def create
    @order = Order.new
    date = order_params[:start_date].split(" to ")
    @order.start_date = date[0]
    @order.end_date = date.length == 1 ? @order.start_date : date[1]
    @order.book_copy_id = set_book_copy.id
    @order.user_id = current_user.id
    @order.status = "CREATED"

    if @order.save
      redirect_to dashboard_path(current_user)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def accept
    @order = Order.find(params[:id])
    @order.update(status: "ACCEPTED")

    # Chatroom is unique to one order
    if Chatroom.find_by(order_id: @order.id).nil?
      @chatroom = Chatroom.new(order_id: @order.id, name: @order.book_copy.book.title)
      @chatroom.save
    end

    respond_to do |format|
      format.html { redirect_to dashboard_path }
      format.text { render partial: "shared/acceptance", locals: { order: @order }, formats: [:html] }
    end
  end

  def reject
    @order = Order.find(params[:id])
    @order.update(status: "REJECTED")

    respond_to do |format|
      format.html { redirect_to dashboard_path }
      format.text { render partial: "shared/acceptance", locals: { order: @order }, formats: [:html] }
    end
  end

  private

  def set_book_copy
    @book_copy = BookCopy.find(params[:book_copy_id])
  end

  def order_params
    params.require(:order).permit(:start_date, :status, :end_date)
  end

  def set_previous_order_dates
    previous_orders = Order.where(book_copy_id: params[:book_copy_id]).where(status: "CONFIRMED").all
    @disable_dates = []
    previous_orders.each do |order|
      @disable_dates << { from: order.start_date.strftime("%F"), to: order.end_date.strftime("%F") }
    end
  end
end


#name: BookCopy.where(id: @order.book_copy_id)[0].)
