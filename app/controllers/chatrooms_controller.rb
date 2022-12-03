class ChatroomsController < ApplicationController
  def index

    @user = current_user # <- You have access through current user.
    @orders = current_user.orders.select{|order| order.status == "ACCEPTED"}
    @book_copys = BookCopy.all.each do |booky_copy|
      @orders.select do |order|
        booky_copy.id == order.book_copy_id
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
