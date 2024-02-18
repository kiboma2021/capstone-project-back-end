class Book < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :favorite_books, dependent: :destroy
  has_many :users, through: :favorite_books
end
