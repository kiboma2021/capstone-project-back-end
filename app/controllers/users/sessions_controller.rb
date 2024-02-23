class Users::SessionsController < Devise::SessionsController
  include RackSessionFix
  respond_to :json

  private

  # Login: POST http://localhost:4000/login
  # Body:
  # "user": {
  #   "name": {name},
  #   "email": {email},
  #   "password": {password}
  # }

  def respond_with(resource, _opts = {})
    if resource.persisted? do
      render json: {
        status: { code: 200, message: 'Logged in sucessfully.' },
        data: UserSerializer.new(resource).serializable_hash[:data][:attributes]
      }, status: :ok
    else
      render json: {
        code: 422,
        message: "User could't log in. #{
          resource.errors.full_messages.to_sentence
        }"
      }, status: :unprocessable_entity
    end
  end

  # Logout: POST http://localhost:4000/logout
  # Header: authorization: {auth_token}

  def respond_to_on_destroy
    if current_user
      render json: {
        status: 200,
        message: 'logged out successfully'
      }, status: :ok
    else
      render json: {
        status: 401,
        message: "Couldn't find an active session."
      }, status: :unauthorized
    end
  end
end
