class BooksController < ApplicationController
  def index
    if params[:query].present?
      sql_query = "title ILIKE :query OR author ILIKE :query OR description ILIKE :query"
      @books = Book.where(sql_query, query: "%#{params[:query]}%")
    else
      @books = Book.all
    end
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.save
  end

  def show
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :author, :description)
  end
end
