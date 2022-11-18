class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    if params[:query].present?
      sql_query = "title ILIKE :query OR author ILIKE :query OR description ILIKE :query"
      @books = Book.where(sql_query, query: "%#{params[:query]}%")
    else
      @books = Book.all
    end
  end

  def dashboard
    current_user_books
    current_user_orders
  end
end
