class IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.all
  end

  def show
    @ingredient = Ingredient.find(params[:id])
  end

  def create
  end

  def new
  end

  def edit
  end

  def update
  end

  def destroy
  end
end