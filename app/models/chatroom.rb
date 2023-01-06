class Chatroom < ApplicationRecord
  has_many :messages, dependent: :destroy
  has_one_attached :photo
  belongs_to :order, dependent: :destroy
  # belongs_to :receiver, class_name: "User"
end
