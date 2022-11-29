class BookreviewsController < ApplicationController
  before_action :set_bookreview, only: %i[new create]
  def new
      # We need @book in our `simple_form_for`
    @book = Book.find(params[:book_id])
    @review = BookReview.new
  end

  def show
  end

  def create
    @review = Review.new(book_review_params)
    @review.book = @book

    if @review.save
      redirect_to book_path(@book)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_bookreview
    @book = Book.find(params[:book_id])
  end
  
  def book_review_params
    params.require(:review).permit(:content)
  end
end
