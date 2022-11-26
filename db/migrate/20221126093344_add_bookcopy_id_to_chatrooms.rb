class AddBookcopyIdToChatrooms < ActiveRecord::Migration[7.0]
  def change
    add_reference :chatrooms, :bookcopy, index: true
  end
end
