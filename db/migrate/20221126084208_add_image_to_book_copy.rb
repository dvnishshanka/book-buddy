class AddImageToBookCopy < ActiveRecord::Migration[7.0]
  def change
    add_column :book_copies, :photo_url, :string
  end
end
