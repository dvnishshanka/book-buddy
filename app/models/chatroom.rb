class Chatroom < ApplicationRecord
  has_many :messages
  has_one_attached :photo
  belongs_to :book_copy, dependent: :destroy
  # belongs_to :receiver, class_name: "User"
end
