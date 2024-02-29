require 'swagger_helper'

RSpec.describe 'api/books', type: :request do
  let(:user) do
    User.create!(
      name: 'username',
      email: 'example@example.com',
      password: 'password'
    )
  end

  path '/books' do
    post 'Creates a book' do
      tags 'Books'
      consumes 'application/json'
      parameter name: :book, in: :body, schema: {
        type: :object,
        properties: {
          user_id: { type: :integer },
          title: { type: :string },
          author: { type: :string },
          price: { type: :number },
          year: { type: :integer },
          rating: { type: :number },
          image_url: { type: :string },
          description: { type: :string }
        },
        required: %w[user_id title author price year rating description]
      }

      response '200', 'Book created successfully' do
        let(:book) do
          {
            title: 'Book Title',
            author: 'Book Author',
            price: 9.99,
            year: 2020,
            rating: 5,
            description: 'Book Description',
            image_url: 'book_image.jpg'
          }
        end
        run_test!
      end

      response '500', 'Book could not be saved' do
        let(:status) do
          {
            code: 500,
            message: "Book couldn't be saved. [+ error messages.]"
          }
        end
        run_test!
      end
    end

    get 'Retrieves all books' do
      tags 'Books'
      produces 'application/json'

      response '200', 'Books retrieved' do
        let(:books) do
          []
        end
        run_test!
      end
    end
  end

  path '/books/{id}' do
    get 'Retrieves a book' do
      tags 'Books'
      produces 'application/json'
      parameter name: :id, in: :path, type: :integer

      response '200', 'Book retrieved' do
        let(:book) do
          Book.new(
            title: 'Moby Dick',
            author: 'Herman Melville',
            description: 'About whales',
            price: 5,
            rating: 4,
            user:,
            year: 1920
          )
        end
        run_test!
      end
    end

    delete 'Deletes a book' do
      tags 'Books'
      produces 'application/json'
      parameter name: :id, in: :path, type: :integer

      response '200', 'Book deleted' do
        let(:response) do
          {
            message: 'Book deleted'
          }
        end
        run_test!
      end

      response '422', 'Book couldn\'t be deleted' do
        let(:response) do
          {
            message: '[error messages]',
            status: {
              code: 422
            }
          }
        end
        run_test!
      end
    end
  end
end
