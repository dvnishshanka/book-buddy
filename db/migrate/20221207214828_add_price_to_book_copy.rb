class AddPriceToBookCopy < ActiveRecord::Migration[7.0]
  def change
    add_column :book_copies, :price, :float
  end
end
