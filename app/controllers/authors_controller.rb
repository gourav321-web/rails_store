require "prawn"
class AuthorsController < ApplicationController

  skip_forgery_protection only: [:create, :update]
  # ... your actions
  def index
    @author = Author.all
    render json: @author, status: :ok
  end

  def show
    @author = Author.find(params[:id])
    # render json: @author, status: :ok
    respond_to do |format|
      format.html
      format.pdf { render pdf: generate_pdf(@author) }
    end
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

  def generate_pdf(client)
      Prawn::Document.new do
        text client.name, align: :center
        # text "Address: #{client.address}"
        # text "Email: #{client.email}"
      end.render
  end
end