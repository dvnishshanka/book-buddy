class RemovePriceFromBookCopy < ActiveRecord::Migration[7.0]
  def change
    remove_column :book_copies, :price, :integer
  end
end
