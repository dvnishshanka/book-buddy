class BookCopiesController < ApplicationController
  def index
    @book_copies = BookCopy.all
  end

  def new
    @book_copy = BookCopy.new
  end

  def create
    @book_copy = BookCopy.new(book_copy_params)
    @book_copy.user_id = current_user
      if @book_copy.save
      redirect_to root_path
    else
    end
  
  end

  def show
    @book_copy = BookCopy.find(params[:id])
    @book_copy.user_id = current_user.id
    @book_copy.save
  end

  private

  def book_copy_params
    params.require(:book_copy).permit(:comments, :availability_status, :book_id)
  end
end
