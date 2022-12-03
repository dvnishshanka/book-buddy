class BookReviewsController < ApplicationController
  def new
    @bookreview = BookReview.new
    @book = Book.find(params[:book_id])
  end

  def show
    @bookreviews = BookReview.all
    @book = Book.find(params[:book_id])
  end

  def create
    @bookreview = BookReview.new(book_review_params)
    @book = Book.find(params[:book_id])
    @bookreview.book = @book
    @bookreview.user_id = current_user.id
    if @bookreview.save
      redirect_to book_path(@book)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @bookreviews = BookReview.all
  end

  private

  def book_review_params
    params.require(:book_review).permit(:rating, :content)
  end
end
