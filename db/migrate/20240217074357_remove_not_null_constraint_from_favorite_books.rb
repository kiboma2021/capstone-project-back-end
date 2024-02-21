class RemoveNotNullConstraintFromFavoriteBooks < ActiveRecord::Migration[7.1]
  def change
    change_column_null :favorite_books, :user_id, true
    change_column_null :favorite_books, :book_id, true
  end
end
