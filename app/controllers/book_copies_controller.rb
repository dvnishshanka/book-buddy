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
    @book_copy.save
  end

  def show
    @book_copy = BookCopy.find(params[:id])
  end

  private

  def book_copy_params
    params.require(:book_copy).permit(:comments)
  end
end
