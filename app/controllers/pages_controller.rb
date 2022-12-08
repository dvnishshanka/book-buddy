class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @horrorbooks = Book.where(category: "Horror").sample(6)
    @irishbooks = Book.all.where(title: ["Modern Classics Nineteen Eighty Four", "Brave New World", "No Longer Human", "Battle Royale", "Poster Girl", "The Candy House"])
    @moviebooks = Book.all.where(title: ["Stories of Your Life and Others", "The Handmaid's Tale", "The Green Mile", "The Man in the High Castle", "The King in Yellow", "Call Me by Your Name"])
    @hash = params
    @hash.key?("category")
    if @hash.key?("category")
      @books = Book.where(category: @hash["category"].capitalize)
    else
      @params_here = false
      if params[:query].present?
        sql_query = "title ILIKE :query OR author ILIKE :query OR description ILIKE :query"
        @books = Book.where(sql_query, query: "%#{params[:query]}%")
      else
        @books = Book.all.sample(12)
      end
      respond_to do |format|
        format.html
        format.text { render partial: "books/list", locals: { books: @books }, formats: [:html] }
      end

    end
  end

  def dashboard
    @book_copies = current_user.book_copies # "All my books"
    @orders = current_user.orders  # "all my requests "
  end
end
