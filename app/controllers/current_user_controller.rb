class CurrentUserController < ApplicationController
  before_action :authenticate_user!

  # GET http://localhost:4000/current_user
  # Headers: authorization: {token_auth}
  def index
    render json: UserSerializer.new(current_user).serializable_hash[:data][:attributes], status: :ok
  end
end
