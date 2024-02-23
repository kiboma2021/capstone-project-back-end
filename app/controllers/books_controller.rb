class BooksController < ApplicationController
  respond_to :json

  # POST http://localhost:4000/books
  # Body:
  # "book": {
  #     "title": {title},
  #     "price": {price},
  #     "year": {year},
  #     "author": {author},
  #     "rating": {rating},
  #     "description": {description},
  #     "user_id": {user_id},
  #     "image_url": {image_url}
  # }

  def create
    @book = Book.new(book_params)
    if @book.save
      render json: {
        status: { code: 200, message: 'Book created successfully.' },
        data: BookSerializer.new(@book).serializable_hash[:data][:attributes]
      }, status: :ok
    else
      render json: {
        status: { code: 500, message: 'Book could not be saved.' },
        message: @book.errors.full_messages
      }, status: :unprocessable_entity
    end
  end

  # GET http://localhost:4000/books/{id}
  def show
    @book = Book.find(params[:id])
    render json: @book, methods: :image_url
  end

  # DELETE http://localhost:4000/books/{id}
  def destroy
    @book = Book.find(params[:id])
    if @book.destroy
      render json: { message: 'Book deleted' }, status: :ok
    else
      render json: { message: @book.errors.full_messages }, status: { code: 422 }
    end
  end

  # GET http://localhost:4000/books
  def index
    @books = Book.all
    render json: @books, methods: :image_url
  end

  private

  def book_params
    params.require(:book).permit(:title, :price, :image_url, :year, :author, :rating, :description, :user_id)
  end
end
