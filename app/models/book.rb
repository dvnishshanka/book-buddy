class Book < ApplicationRecord
  has_many :book_copies, dependent: :destroy
  has_many :book_reviews, dependent: :destroy
  validates :category, presence: true
  validates :year, :pages, numericality: true

  def ribbon(type)
    case type
    when "Greek mythology"
      return "#A790A5"
    when "Horror"
      return "#DD1C1A"
    when "Classic"
      return  "#946846"
    when "Travel"
      return  "#4EA699"
    when "Non-fiction"
      return  "#6E8894"
    when "Romance"
      return  "#E83F6F"
    when "Education"
      return  "#559CAD"
    when "Sci-fi"
      return  "#197BBD"
    when "Fiction"
      return  "#DB8A74"
    when "Poetry"
      return  "#828489"
    when "Crime"
      return  "#F42C04"
    when "Comedy"
      return  "#FE5D26"
    else
      return "#1F7A8C"
    end
  end
end
