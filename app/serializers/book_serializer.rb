class BookSerializer
  include JSONAPI::Serializer
  attributes :title, :price, :image_url, :author, :year, :rating, :description

  def image_url
    object.image_url
  end
end
