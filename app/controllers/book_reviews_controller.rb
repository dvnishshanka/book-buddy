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
    respond_to do |format|
      if @bookreview.save
        format.html { redirect_to new_book_book_review_path(@book, @bookreview) }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
      format.json
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
