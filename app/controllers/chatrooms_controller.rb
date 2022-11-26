class ChatroomsController < ApplicationController
  def index
    @user = current_user # <- You have access through current user.
    @chatroom = Chatroom.where(id: @user)
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end

  def create
    @message = Message.new
  end
end
