require 'swagger_helper'

RSpec.describe 'api/favourites', type: :request do
  path '/favourites' do
    post 'Creates a favourite book association' do
      tags 'Favourites'
      consumes 'application/json'
      parameter name: :favourite, in: :body, schema: {
        type: :object,
        properties: {
          user_id: { type: :string },
          book_id: { type: :string }
        },
        required: %w[user_id book_id]
      }

      response '200', 'Added to favourites!' do
        let(:response) do
          {
            message: 'Added to favourites!'
          }
        end
        run_test!
      end

      response '401', 'Someting went wrong' do
        let(:response) do
          {
            message: 'Something went wrong. [error description]'
          }
        end
        run_test!
      end
    end

    get 'Retrieves the favourite book id list' do
      tags 'Favourites'
      parameter name: :id, in: :query, type: :integer

      response '200', 'Favourite list found!' do
        let(:favourites) do
          []
        end
        run_test!
      end
    end
  end

  path '/favourites/{id}' do
    get 'Retrieves a favourite book association' do
      tags 'Favourites'
      parameter name: :id, in: :path, tipe: :integer

      response '200', 'Favourite found!' do
        let(:favourite) do
          {
            user_id: 1,
            book_id: 2
          }
        end
        run_test!
      end
    end

    delete 'Deletes a favourite book association' do
      tags 'Favourites'
      parameter name: :id, in: :path, type: :integer

      response '200', 'Deleted from favourites' do
        let(:response) do
          {
            message: 'Deleted from favourites'
          }
        end
        run_test!
      end

      response '422', 'Something went wrong' do
        let(:response) do
          {
            message: 'Something went wrong. [error description]'
          }
        end
        run_test!
      end
    end
  end
end
