class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :book_copies, dependent: :destroy
  has_one_attached :photo
  has_many :orders, dependent: :destroy
  has_many :book_reviews, dependent: :destroy
  has_many :order_reviews, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
