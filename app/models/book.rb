class Book < ApplicationRecord
  has_one_attached :image, dependent: :destroy
  belongs_to :user
  has_many :favorite_books, dependent: :destroy
  has_many :users, through: :favorite_books
  validates :title, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :author, presence: true
  validates :year, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :rating, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 5 },
                     allow_nil: true
end
