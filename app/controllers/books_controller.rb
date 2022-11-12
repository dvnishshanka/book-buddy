class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def index
    @books = Book.all
  end

  def create
    @book = Book.new(book_params)
    @book.save
  end

  def book_params
    params.require(:book).permit(:title, :author, :description)
  end
end
