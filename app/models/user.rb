class User < ApplicationRecord
  has_many :favorite_books, dependent: :destroy
  has_many :books, through: :favorite_books
  has_many :books
end
