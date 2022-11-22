class ChatroomsController < ApplicationController
  def index
    @user = current_user
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end

  def create
    @message = Message.new
  end
end
