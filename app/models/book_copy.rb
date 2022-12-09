class BookCopy < ApplicationRecord
  belongs_to :book
  belongs_to :user
  has_many :orders, dependent: :destroy
  validates :condition, presence: true, inclusion: { in: [1, 2, 3, 4, 5], allow_nil: false }
  validates :availability_status, presence: true
  validates :price, numericality: true
end
