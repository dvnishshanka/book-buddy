class CreateOrderReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :order_reviews do |t|
      t.text :content
      t.integer :rating
      t.references :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
