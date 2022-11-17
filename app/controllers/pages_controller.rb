class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @books = Book.all.sample(6)
  end

  def dashboard
    current_user_books
    current_user_orders
  end
end
