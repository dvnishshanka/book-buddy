class RemoveBookCopyFromChatroom < ActiveRecord::Migration[7.0]
  def change
    remove_column :chatrooms, :book_copy_id, :integer
  end
end
