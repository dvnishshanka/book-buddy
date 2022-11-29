class Book < ApplicationRecord
  has_many :book_copies, dependent: :destroy
  has_and_belongs_to_many :categories
  has_many :reviews, dependent: :destroy
end
