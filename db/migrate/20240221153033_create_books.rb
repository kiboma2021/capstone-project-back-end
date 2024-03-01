class CreateBooks < ActiveRecord::Migration[7.1]
  def change
    create_table :books do |t|
      t.string :title
      t.integer :price
      t.string :author
      t.integer :year
      t.integer :rating
      t.string :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
