class BookReview < ApplicationRecord
  belongs_to :book, class_name: "Book", dependent: :destroy
  belongs_to :user, dependent: :destroy
  validates :rating, :content, presence: true
end
