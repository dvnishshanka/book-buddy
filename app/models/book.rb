class Book < ApplicationRecord
  has_many :book_copies, dependent: :destroy
  has_many :book_reviews, dependent: :destroy
end
