require 'rails_helper'

RSpec.describe 'Users requests', type: :request do
  describe 'POST /signup' do
    it 'creates a new user' do
      expect do
        post '/signup', params: { user: {
          name: 'John Doe',
          email: 'john@example.com',
          password: 'password123',
          password_confirmation: 'password123'
        } }
      end.to change(User, :count).by(1)
      expect(response).to have_http_status(:ok)
    end

    it 'returns validation errors if user creation fails' do
      expect do
        post '/signup', params: { user: { name: 'John Doe', email: 'john@example.com' } }
      end.not_to change(User, :count)
      expect(response).to have_http_status(:unprocessable_entity)
      expect(response.body).to match(/Password can't be blank/)
    end
  end

  describe 'DELETE /signup' do
    let(:user) do
      User.new(name: 'John Doe', email: 'john@example.com', password: 'password123',
               password_confirmation: 'password123')
    end
    before do
      user.save!
    end
    it 'deletes the current user' do
      post '/login', params: {
        user: {
          email: 'john@example.com',
          password: 'password123'
        }
      }

      puts response.body
      response.headers['Authorization']

      expect do
        delete '/signup'
      end.to change(User, :count).by(-1)

      puts user

      expect(user.exist?).to be(false)
    end

    it "fails to delete an user when there's not an active session" do
      delete '/signup'

      expect(response).to have_http_status(500)
    end
  end

  describe 'POST /login' do
    let(:user) do
      User.new(name: 'John Doe', email: 'john@example.com', password: 'password123',
               password_confirmation: 'password123')
    end
    before do
      user.save!
    end
    it 'returns a success response' do
      post '/login', params: {
        user: {
          email: 'john@example.com',
          password: 'password123'
        }
      }
      expect(response.body).to match(/Logged in successfully/)
    end

    it 'logs out successfully' do
      post '/login', params: {
        user: {
          email: 'john@example.com',
          password: 'password123'
        }
      }

      token = response.headers['Authorization']

      delete '/logout', headers: {
        'Authorization' => token
      }
      expect(response.body).to match(/logged out successfully/)
    end
  end
end
