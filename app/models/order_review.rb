class OrderReview < ApplicationRecord
  belongs_to :order
  belongs_to :user
  validates  :content, presence: true
  validates :rating, presence: true, inclusion: { in: [1, 2, 3, 4, 5], allow_nil: false }
end
