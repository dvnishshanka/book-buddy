class CreateBookCopies < ActiveRecord::Migration[7.0]
  def change
    create_table :book_copies do |t|
      t.references :book, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :price
      t.string :availability_status
      t.text :comments

      t.timestamps
    end
  end
end
