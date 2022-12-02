class ChatroomsController < ApplicationController
  def index
    @user = current_user # <- You have access through current user.
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
