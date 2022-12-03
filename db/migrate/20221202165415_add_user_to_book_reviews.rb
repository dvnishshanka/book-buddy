class AddUserToBookReviews < ActiveRecord::Migration[7.0]
  def change
    add_reference :book_reviews, :user, null: false, foreign_key: true
  end
end
