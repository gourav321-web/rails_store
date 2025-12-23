class BooksController < ApplicationController
  around_action :messege

  skip_forgery_protection only: [:create, :update, :delete]
  def index
    @book = Book.all
    render json: @book, status: :ok
  end

  def show
    @book = Book.find(params[:id])
    render json: @book ,status: :ok
  end

  def create
    @book = Book.new(acc_params)
    @book.save
    render json: @book, status: :ok
  end

  def update
    @book = Book.find(params[:id])
    @book[:name] = params[:name]
    @book.save
    render json: @book, status: :ok
  end

  def delete
    @book = Book.find(params[:id])
    @book.destroy
    render json: @book, status: :ok
  end

  private

  def acc_params
    params.require(:book).permit(:name, :author_id)
  end

  # def messege
  #   render json:"it works"
  # end
end
