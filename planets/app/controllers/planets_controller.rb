class PlanetsController < ApplicationController
  def index
    @planets = Planet.all
  end

  def new
  end

  def create
    Planet.create(params[:planet])
    redirect_to(planets_path)
  end

  def show
    @planet = Planet.find(params[:id])
  end
end
