class Book < ApplicationRecord
  has_many :book_copies, dependent: :destroy
end
