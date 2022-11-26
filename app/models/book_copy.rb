class BookCopy < ApplicationRecord
  belongs_to :book
  belongs_to :user
  has_many :orders, dependent: :destroy
end
