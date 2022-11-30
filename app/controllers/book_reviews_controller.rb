class BookReviewsController < ApplicationController
  before_action :set_book_review, only: %i[new create]
  def new
      # We need @book in our `simple_form_for`
    @book = Book.find(params[:book_id])
    @book_review = BookReview.new
  end

  def show
  end

  def create
    @book_review = BookReview.new(book_review_params)
    @book_review.book = @book

    if @book_review.save
      redirect_to book_path(@book)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_book_review
    @book = Book.find(params[:book_id])
  end

  def book_review_params
    params.require(:book_review).permit(:rating, :content)
  end
end
