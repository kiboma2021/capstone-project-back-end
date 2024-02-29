require 'rails_helper'

RSpec.describe 'favourites requests', type: :request do
  let(:user) do
    User.new(
      name: 'username',
      email: 'example@example.com',
      password: 'password123',
      password_confirmation: 'password123'
    )
  end

  let(:book) do
    Book.new(
      title: 'Book1',
      price: 4,
      year: 2004,
      author: 'Author',
      rating: 3,
      description: 'Description',
      user_id: user.id
    )
  end

  before do
    user.save!
    book.save!
  end

  describe 'POST /favourites' do
    it 'adds a book as a favourite' do
      post '/favourites', params: {
        favourite: {
          book_id: book.id,
          user_id: user.id
        }
      }

      expect(response).to have_http_status(:ok)
      expect(response.body).to match(/Added to favourites!/)
    end
  end

  describe 'DELETE /favourites' do
    let(:favourite) do
      Favourite.new(
        book:,
        user:
      )
    end

    before do
      favourite.save!
    end

    it 'deletes a favourite book association' do
      delete "/favourites/#{favourite.id}"

      expect(response).to have_http_status(:ok)
      expect(response.body).to match(/Deleted from favourites/)
    end
  end

  describe 'GET /favourites/{id}' do
    let(:favourite) do
      Favourite.new(
        book:,
        user:
      )
    end

    before do
      favourite.save!
    end

    it 'shows a favourite book association by id' do
      get "/favourites/#{favourite.id}"

      expect(response).to have_http_status(:ok)
      expect(response.body).to match(/#{user.id}/)
      expect(response.body).to match(/#{book.id}/)
    end
  end
end
