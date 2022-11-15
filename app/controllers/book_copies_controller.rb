class BookCopiesController < ApplicationController
  def new
    @book_copy = BookCopy.new
  end

  def create
    @book_copy = BookCopy.new(book_copy_params)
    @book_copy.user_id = current_user.id
    if @book_copy.save
      redirect_to root_path
    else
    end
  end

  private

  def book_copy_params
    params.require(:book_copy).permit(:comments, :availability_status, :book_id)
  end
end
