class OrderReview < ApplicationRecord
  belongs_to :order
  belongs_to :user
  validates :rating, :content, presence: true
end
