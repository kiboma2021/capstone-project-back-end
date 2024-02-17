class Book < ApplicationRecord
  belongs_to :user
  has_many :favorite_books, dependent: :destroy
  has_many :users, through: :favorite_books
end
