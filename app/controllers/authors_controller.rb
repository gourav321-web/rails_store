class AuthorsController < ApplicationController

  skip_forgery_protection only: [:create, :update]
  # ... your actions
  def index
    @author = Author.all
    render json: @author, status: :ok
  end

  def show
    @author = Author.find(params[:id])
    render json: @author, status: :ok
  end

  def create
    @author = Author.create(create_author)
    render json: @author, status: :ok
  end

  def update
    @author = Author.find(params[:id])
    @author[:name] = params[:name]
    @author.save
    render json: @author, status: :ok

  end

  def delete
    @author = Author.find(params[:id])
    @author.destroy
  end

  private

  def create_author
    params.require(:author).permit(:name)
  end
end