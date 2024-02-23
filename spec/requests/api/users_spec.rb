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
        run_test!
      end

      response '422', "User couldn't be created successfully." do
        let(:status) {
          {
            code: 422,
            message: "User couldn't be created successfully. [+ error messages.]"
          }
        }
        run_test!
      end
    end

    delete 'Deletes an user' do
      tags 'Users'
      consumes 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          email: { type: :string },
          password: { type: :string }
        }
      }

      response '200', 'Account deleted successfully' do
        let(:status) {
          {
            code: 200,
            message: 'Account deleted successfully.'
          }
        }
        run_test!
      end

      response '422', "Account couldn't be deleted successfully." do
        let(:status) {
          {
            code: 422,
            message: "Account couldn't be deleted successfully."
          }
        }
        run_test!
      end
    end
  end

  path '/login' do
    post 'Logs in the user' do
      tags 'Users'
      consumes 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          email: { type: :string},
          password: { type: :string}
        },
        required: %w[email password]
      }

      response '200', 'User logged in successfully' do
        let(:response) {
          {
            status: {
              code: 200, message: 'Logged in successfully'
            },
            data: {
              id: 1,
              name: "Username",
              email: 
            }
          }
        }
        run_test!
      end

      response '422', 'User could not log in' do
        let(:response) {
          {
            code: 422,
            message: "User couldn't log in. [error messages]"
          }
        }
      end
    end

    delete 'Deletes user' do
      tags 'Users'
      parameter name: :auth_token, in: :header, type: :string

      response '200', 'Logged out successfully' do
        let(:respoonse) {
          {
            status: 200,
            message: "logged out successfully",
          }
        }
        run_test!
      end

      response '401', 'Could not find an active session' do
        let(:response) {
          {
            status: 401,
            message: 'Could not find an active session'
          }
        }
        run_test!
      end
    end
  end
end
