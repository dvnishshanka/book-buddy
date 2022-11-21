class BookCopiesController < ApplicationController
  before_action :set_book, only: %i[show new]

  def index
    @book_copies = BookCopy.all
  end

  def new
    @book_copy = BookCopy.new
    set_book
  end

  def create
    @book_copy = BookCopy.new(book_copy_params)
    @book_copy.book = set_book if @book_copy.book_id.nil?
    @book_copy.user = current_user
    if @book_copy.save
      redirect_to book_path(@book_copy.book_id)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_book
    @book = Book.find(params[:book_id])
  end

  def book_copy_params
    params.require(:book_copy).permit(:comments, :availability_status, :price)
  end
end
