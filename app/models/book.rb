class Book < ApplicationRecord
  has_one_attached :image, dependent: :destroy
  belongs_to :user
  has_many :favourites, dependent: :destroy
  has_many :users, through: :favourites
  validates :title, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :author, presence: true
  validates :description, presence: true, length: { maximum: 70 }
  validates :year, presence: true, numericality: { only_integer: true, greater_than: 1000 }
  validates :rating, presence: true,
                     numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }

  def image_url
    Rails.application.routes.url_helpers.url_for(image) if image.attached?
  end
end
