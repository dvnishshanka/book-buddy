class BookReviewsController < ApplicationController
  def new
    @bookreview = BookReview.new
  end

  def show
    @bookreviews = BookReview.all
    @book = Book.find(params[:book_id])
  end

  def create
    # raise
    @book = Book.find(params[:book_id])
    @bookreview = BookReview.new(book_review_params)
    @bookreview.book = @book
    @bookreview.save!
  end

  def index
    @bookreviews = BookReview.all
  end

  private

  def book_review_params
    params.require(:bookreview).permit(:content)
  end
end
