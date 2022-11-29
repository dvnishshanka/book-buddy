class BookCopy < ApplicationRecord
  belongs_to :book
  belongs_to :user
  has_many :orders, dependent: :destroy
  has_many :chatrooms, dependent: :destroy
end
