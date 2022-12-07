class ChatroomsController < ApplicationController
  def index
    @user = current_user # <- You have access through current user.
    @orders = current_user.orders.select { |order| order.status == "ACCEPTED" } # all accepted bookings of current_user
    @my_book_orders = []
    BookCopy.where(user_id: current_user.id).each do |book_copy|
      book_copy.orders.each do |order|
        @my_book_orders << order if order.status == "ACCEPTED"
      end
    end

    @chatroom = Chatroom.where(id: @user)
    # @chatroom = Chatroom.where(current_user)
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end

  def create
    @chatroom = Chatroom.new
    @chatroom.book_copy = BookCopy.find(params[:bookcopy_id])
    if @chatroom.save
      redirect_to chatroom_path(@chatroom)
    else
      render :new, status: :unprocessable_entity
    end
  end
end
