class Chatroom < ApplicationRecord
  has_many :messages
  has_one_attached :photo
  # belongs_to :sender, class_name: "User"
  # belongs_to :receiver, class_name: "User"
end
