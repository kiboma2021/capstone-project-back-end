class FixUserColumn < ActiveRecord::Migration[7.1]
  def change
    rename_column :users, :text, :password
  end
end
