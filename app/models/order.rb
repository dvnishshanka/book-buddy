class Order < ApplicationRecord
  belongs_to :user
  belongs_to :book_copy
  belongs_to :order_review
end
