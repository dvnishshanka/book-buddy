class BookReview < ApplicationRecord
  belongs_to :book
  belongs_to :user
  validates :content, presence: true
end
