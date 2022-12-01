class BookReview < ApplicationRecord
  belongs_to :book, dependent: :destroy
  belongs_to :user
  validates :rating, :content, presence: true
end
