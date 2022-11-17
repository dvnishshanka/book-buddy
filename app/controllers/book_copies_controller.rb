class BookCopiesController < ApplicationController
  before_action :set_book_copy, only: %i[show]
  before_action :set_book_copy, only: %i[show]

  def index
    @book_copies = BookCopy.all
  end

  def new
    @book_copy = BookCopy.new
    @books = Book.all
  end

  def create
    @book_copy = BookCopy.new(book_copy_params)
    @book_copy.user = current_user
    if @book_copy.save
      redirect_to book_path(@book_copy.book)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  private

  def set_book_copy
    @book_copy = BookCopy.find(params[:id])
  end

  def book_copy_params
    params.require(:book_copy).permit(:comments, :availability_status, :book_id)
  end
end
