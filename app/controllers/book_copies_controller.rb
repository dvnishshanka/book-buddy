class BookCopiesController < ApplicationController
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

  def search_book(book_name)
    uri = URI("https://www.googleapis.com/books/v1/volumes?q=#{book_name}&langRestrict=en&key=AIzaSyB0fBuVdMBemt9qqtw4U9uDwzGUptI-SOk")
    results = URI.open(uri).read
    user = JSON.parse(results)

    # response = Net::HTTP.get(uri)
    # book = JSON.parse(response)
    book = user["items"][0]
    # 1.times do |i|
      # books["items"].each do |book|
        Book.create!(
          title: book["volumeInfo"]["title"],
          author: book["volumeInfo"]["authors"].nil? ? nil : book["volumeInfo"]["authors"][0],
          description: book["volumeInfo"]["description"],
          pages: book["volumeInfo"]["pageCount"],
          year: book["volumeInfo"]["publishedDate"],
          publisher: book["volumeInfo"]["publisher"],
          isbn: book["volumeInfo"]["industryIdentifiers"].nil? ? nil : book["volumeInfo"]["industryIdentifiers"][0]["identifier"], #tenery operater
          category: book["volumeInfo"]["categories"].nil? ? nil : book["volumeInfo"]["categories"][0],
          language: book["volumeInfo"]["language"],
          photo_url: "https://books.google.com/books/content?id=#{book['id']}&printsec=frontcover&img=1&zoom=1&source=gbs_api")
  end
end
