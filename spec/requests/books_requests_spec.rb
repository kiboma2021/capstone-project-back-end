require 'rails_helper'

RSpec.describe 'books requests', type: :request do
  describe 'POST /books' do
    let(:user) { User.new(
      name: 'username',
      email: 'example@example.com',
      password: 'password123',
      password_confirmation: 'password123'
    )}
    before do
      user.save!
    end

    it 'creates a new book' do
      post '/books', params: {
        book: {
          title: 'Book1',
          price: 4,
          year: 2004,
          author: 'Author',
          rating: 3,
          description: 'Description',
          user_id: user.id
        }
      }

      expect(response.body).to match(/Book created successfully/)
    end

    it 'fails creating a new book when title missing' do
      post '/books', params: {
        book: {
          title: '',
          price: 4,
          year: 2004,
          author: 'Author',
          rating: 3,
          description: 'Description',
          user_id: user.id
        }
      }

      expect(response.body).to match(/Title can't be blank/)
    end

    it 'fails creating a new book when price missing' do
      post '/books', params: {
        book: {
          title: 'Title1',
          year: 2004,
          author: 'Author',
          rating: 3,
          description: 'Description',
          user_id: user.id
        }
      }

      expect(response.body).to match(/Price can't be blank/)
    end

    it 'fails creating a new book when year missing' do
      post '/books', params: {
        book: {
          title: 'Book1',
          price: 4,
          author: 'Author',
          rating: 3,
          description: 'Description',
          user_id: user.id
        }
      }

      expect(response.body).to match(/Year can't be blank/)
    end

    it 'fails creating a new book when author missing' do
      post '/books', params: {
        book: {
          title: 'Book1',
          price: 4,
          year: 2004,
          rating: 3,
          description: 'Description',
          user_id: user.id
        }
      }

      expect(response.body).to match(/Author can't be blank/)
    end

    it 'fails creating a new book when rating missing' do
      post '/books', params: {
        book: {
          title: 'Book1',
          price: 4,
          year: 2004,
          author: 'Author',
          description: 'Description',
          user_id: user.id
        }
      }

      expect(response.body).to match(/Rating can't be blank/)
    end

    it 'fails creating a new book when description missing' do
      post '/books', params: {
        book: {
          title: 'Book1',
          price: 4,
          year: 2004,
          author: 'Author',
          rating: 3,
          description: '',
          user_id: user.id
        }
      }

      expect(response.body).to match(/Description can't be blank/)
    end

    it 'fails creating a new book when title missing' do
      post '/books', params: {
        book: {
          title: 'Book1',
          price: 4,
          year: 2004,
          author: 'Author',
          rating: 3,
          description: 'Description'
        }
      }

      expect(response.body).to match(/User must exist/)
    end
  end

  describe 'GET /books/{id}' do
    let(:user) { User.new(
      name: 'username',
      email: 'example@example.com',
      password: 'password123',
      password_confirmation: 'password123'
    )}

    let(:book) { Book.new(
      title: 'Book1',
      price: 4,
      year: 2004,
      author: 'Author',
      rating: 3,
      description: 'Description',
      user_id: user.id
    )}

    before do
      user.save!
      book.save!
    end

    it 'shows a book by id' do
      get "/books/#{book.id}"

      expect(response.body).to match(/Book1/)
      expect(response.body).to match(/4/)
      expect(response.body).to match(/2004/)
      expect(response.body).to match(/Author/)
      expect(response.body).to match(/3/)
      expect(response.body).to match(/Description/)
      expect(response.body).to match(/#{user.id}/)
    end
  end

  describe 'DELETE /books/{id}' do
    let(:user) { User.new(
      name: 'username',
      email: 'example@example.com',
      password: 'password123',
      password_confirmation: 'password123'
    )}

    let(:book) { Book.new(
      title: 'Book1',
      price: 4,
      year: 2004,
      author: 'Author',
      rating: 3,
      description: 'Description',
      user_id: user.id
    )}
    before do
      user.save!
      book.save!
    end

    it 'deletes a book by id' do
      expect{ delete "/books/#{book.id}" }
      .to change(Book, :count).by(-1)

      expect(response.body).to match(/Book deleted/)
    end
  end

  describe 'GET /books' do
    let(:user) { User.new(
      name: 'username',
      email: 'example@example.com',
      password: 'password123',
      password_confirmation: 'password123'
    )}

    let(:book) { Book.new(
      title: 'Book1',
      price: 4,
      year: 2004,
      author: 'Author',
      rating: 3,
      description: 'Description',
      user_id: user.id
    )}

    let(:book2) { Book.new(
      title: 'Book2',
      price: 4,
      year: 2004,
      author: 'Author',
      rating: 3,
      description: 'Description',
      user_id: user.id
    )}

    before do
      user.save!
      book.save!
      book2.save!
    end
    it 'retrieves all books' do
      get '/books'

      expect(response.body).to match(/Book1/)
      expect(response.body).to match(/Book2/)
    end
  end
end