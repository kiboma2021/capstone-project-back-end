require 'swagger_helper'

RSpec.describe 'api/users', type: :request do
  path '/signup' do
    post 'Creates an user' do
      tags 'Users'
      consumes 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          email: { type: :string },
          password: { type: :string },
          password_confirmation: { type: :string }
        },
        required: %w[name email password]
      }

      response '200', 'Signed up successfully' do
        let(:user) { 
          { 
            id: 1,
            name: 'username',
            email: 'username@example.com'
          }
        }
      end

      response '422', "User couldn't be created successfully." do
        let(:status) {
          {
            code: 422,
            message "User couldn't be created successfully. [+ error messages.]"
          }
        }
      end
    end

    delete 'Deletes an user' do
      tags 'Users'
      consumes 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          name: 'username',
          email: 'username@example.com',
          password: 'password123'
        }
      }

      response '200', 'Account deleted successfully' do
        let(:status) {
          code: 200,
          message: 'Account deleted successfully.'
        }
      end

      response '422', "Account couldn't be deleted successfully." do
        let(:status) {
          code: 422,
          message: "Account couldn't be deleted successfully."
        }
      end
    end
end
