class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :book_copies
  has_one_attached :photo
  has_many :orders
  has_many :order_reviews
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
