class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @hash = params
    # raise
    @hash.key?("category")
    if @hash.key?("category")
      @books = Book.where(category: @hash["category"].capitalize)
    else
      @params_here = false
      if params[:query].present?
        sql_query = "title ILIKE :query OR author ILIKE :query OR description ILIKE :query"
        @books = Book.where(sql_query, query: "%#{params[:query]}%")
      else
        @books = Book.all.sample(8)
      end
      respond_to do |format|
        format.html # Follow regular flow of Rails
        format.text { render partial: "books/list", locals: { books: @books }, formats: [:html] }
      end
      @horrorbooks = Book.where(category: "Horror")

    end
  end

  def dashboard
     @book_copies = current_user.book_copies # "All my books"
    @orders = current_user.orders  # "all my requests "

  end
end
