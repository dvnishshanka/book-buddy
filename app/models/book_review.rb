class BookReview < ApplicationRecord
  belongs_to :book
  belongs_to :user
  validates :rating, :content, presence: true
end
