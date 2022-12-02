class Message < ApplicationRecord
  belongs_to :chatroom
  belongs_to :User
  has_one_attached :photo

  def sender?(a_user)
    user.id == a_user.id
  end
end
