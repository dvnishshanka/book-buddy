class AddImageToBooks < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :photo_url, :string
  end
end
