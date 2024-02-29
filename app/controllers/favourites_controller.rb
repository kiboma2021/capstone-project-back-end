class FavouritesController < ApplicationController
  respond_to :json
  before_action :set_favourite, only: %i[destroy show]

  # POST http://localhost:4000/favourites
  # Body:
  # "favourite": {
  #     "user_id": {user_id},
  #     "book_id": {book_id}
  # }

  def create
    @favourite = Favourite.new(favourite_params)
    if @favourite.save
      render json: {
        message: 'Added to favourites!'
      }, status: :ok
    else
      render json: {
        message: "Something went wrong. #{@favourite.errors.full_messages}"
      }, status: :unauthorized
    end
  end

  # DELETE http://localhost:4000/favourites/{id}
  def destroy
    if @favourites.destroy
      render json: { message: 'Deleted from favourites' },
             status: :ok
    else
      render json: { message: "Something went wrong. #{@favourites.errors.full_messages}" }
    end
  end

  # GET http://localhost:4000/favourites/{id}
  def show
    render json: @favourites
  end

  # GET http://localhost:4000/favourites?id={user_id}
  def index
    @user_id = params[:id]
    if @user_id
      @favourites = Favourite.where(user_id: @user_id).includes(:book)
      render json: @favourites.as_json(include: { book: { methods: :image_url } })
    else
      render json: { message: 'User not found' }, status: :not_found
    end
  end

  private

  def set_favourite
    @favourites = Favourite.find(params[:id])
  end

  def favourite_params
    params.require(:favourite).permit(:user_id, :book_id)
  end
end
