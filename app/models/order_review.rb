class OrderReview < ApplicationRecord
  belongs_to :order, dependent: :destroy
  belongs_to :user, dependent: :destroy
  validates :rating, :content, presence: true
end
