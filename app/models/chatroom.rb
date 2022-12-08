class Chatroom < ApplicationRecord
  has_many :messages, dependent: :destroy
  has_one_attached :photo
  belongs_to :book_copy
  # belongs_to :receiver, class_name: "User"
end
