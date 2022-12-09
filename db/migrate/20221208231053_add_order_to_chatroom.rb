class AddOrderToChatroom < ActiveRecord::Migration[7.0]
  def change
    add_reference :chatrooms, :order, null: false, foreign_key: true
  end
end
