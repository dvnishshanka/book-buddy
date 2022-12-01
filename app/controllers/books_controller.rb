require 'json'
require 'open-uri'
require 'net/http'
require 'openssl'
require 'nokogiri'

class BooksController < ApplicationController
  def new
    @book = Book.new
    @book_review = BookReview.new

    set_details_from_api if defined?(params["volumeInfo"]["title"])
  end

  def index
    @search = params[:query]
    search_book(@search) if @search
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to book_path(@book)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @book = Book.find(params[:id])
    @bookreview = BookReview.new  # Add this line
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :description, :pages, :year, :publisher,
                                 :isbn, :category, :language, :photo_url)
  end

  def search_params
    params.require(:book).permit(:query)
  end

  def search_book(search)
    uri = URI("https://www.googleapis.com/books/v1/volumes?q=#{search}&langRestrict=en&key=AIzaSyB0fBuVdMBemt9qqtw4U9uDwzGUptI-SOk")
    results = URI.open(uri).read
    user = JSON.parse(results)
    @books = user["items"]
  end

  def set_details_from_api
    @book.title = params["volumeInfo"]["title"]
    @book.author = params["volumeInfo"]["authors"].nil? ? nil : params["volumeInfo"]["authors"][0]
    @book.description = params["volumeInfo"]["description"]
    @book.pages = params["volumeInfo"]["pageCount"]
    @book.year = params["volumeInfo"]["publishedDate"]
    @book.publisher = params["volumeInfo"]["publisher"]
    @book.isbn = params["volumeInfo"]["industryIdentifiers"].nil? ? nil : params["volumeInfo"]["industryIdentifiers"][0]["identifier"]
    @book.category = params["volumeInfo"]["categories"].nil? ? nil : params["volumeInfo"]["categories"][0]
    @book.language = params["volumeInfo"]["language"]
    @book.photo_url = "https://books.google.com/books/content?id=#{params['id']}&printsec=frontcover&img=1&zoom=1&source=gbs_api"
  end
end
