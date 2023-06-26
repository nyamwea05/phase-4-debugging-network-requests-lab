class ToysController < ApplicationController
  wrap_parameters format: []

  def create
    toy = Toy.new(toy_params)
    if toy.save
      render json: toy, status: :created
    else
      render json: { error: toy.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # Other actions...

  private
  
  def toy_params
    params.permit(:name, :image, :likes)
  end
end