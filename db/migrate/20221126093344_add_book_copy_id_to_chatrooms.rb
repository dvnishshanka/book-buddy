class AddBookCopyIdToChatrooms < ActiveRecord::Migration[7.0]
  def change
    add_reference :chatrooms, :book_copy, index: true
  end
end
