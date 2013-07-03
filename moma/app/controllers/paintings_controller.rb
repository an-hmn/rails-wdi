class PaintingsController < ApplicationController
  def index
    @paintings = Painting.all
  end

  def new
    @painting = Painting.new
  end

  def create
    painting = Painting.create(params[:painting])
    redirect_to(painting)
  end

  def show
    @painting = Painting.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
