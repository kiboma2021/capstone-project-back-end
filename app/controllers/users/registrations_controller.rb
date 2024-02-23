class Users::RegistrationsController < Devise::RegistrationsController
  include RackSessionFix
  respond_to :json

  private

  # Register: POST http://localhost:4000/signup
  # Body:
  # "user": {
  #   "name": {name},
  #   "email": {email},
  #   "password": {password},
  #   "password_confirmation": {password}
  # }

  def respond_with(resource, _opts = {})
    if request.method == 'POST' && resource.persisted?
      render json: {
        status: { code: 200, message: 'Signed up sucessfully.' },
        data: UserSerializer.new(resource).serializable_hash[:data][:attributes]
      }, status: :ok
    else
      render json: {
        status: { code: 422,
        message:
        "User couldn't be created successfully.
        #{resource.errors.full_messages.to_sentence}" }
        }, status: :unprocessable_entity
    end

    if request.method == 'DELETE'
      render json: {
        status: { code: 200, message: 'Account deleted successfully.' }
      }, status: :ok
    else
      render json: {
        status: { code: 422, message: "Account couldn't be deleted successfully." }
      }, status: :unprocessable_entity
    end
  end
end
