class AddConditionToBookCopy < ActiveRecord::Migration[7.0]
  def change
    add_column :book_copies, :condition, :integer
  end
end
