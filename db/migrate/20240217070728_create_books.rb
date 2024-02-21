class CreateBooks < ActiveRecord::Migration[7.1]
  def change
    create_table :books do |t|
      t.text :title
      t.integer :price
      t.text :author
      t.text :description
      t.integer :year
      t.integer :rating
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
