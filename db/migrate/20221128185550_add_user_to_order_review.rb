class AddUserToOrderReview < ActiveRecord::Migration[7.0]
  def change
    add_reference :order_reviews, :user, null: false, foreign_key: true
  end
end
