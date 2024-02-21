class User < ApplicationRecord
  has_many :favorite_books, dependent: :destroy
  has_many :books, through: :favorite_books
  has_many :books
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true, length: { minimum: 6 }
end
