class BookCopy < ApplicationRecord
  belongs_to :book
  belongs_to :user, dependent: :destroy
  has_many :orders, dependent: :destroy
end
