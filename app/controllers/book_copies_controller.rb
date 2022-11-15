class BookCopiesController < ApplicationController
  def new
    @book_copy = BookCopy.new
  end

  def create
    @book_copy = BookCopy.new(book_copy_params)
    @book_copy.user_id = current_user
    @book_copy.save
  end

  private

  def book_copy_params
    params.require(:book_copy).permit(:comments)
  end
end
