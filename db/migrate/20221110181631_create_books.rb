class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :publisher
      t.string :isbn
      t.text :description
      t.string :format
      t.string :language
      t.integer :year
      t.string :category
      t.integer :pages

      t.timestamps
    end
  end
end
