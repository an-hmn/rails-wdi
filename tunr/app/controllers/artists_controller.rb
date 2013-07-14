class ArtistsController < ApplicationController
  before_filter :check_if_admin

  def index
    @artists = Artist.order(:name).uniq
  end

  def show
    @artist = Artist.find(params[:id])
  end

  private
  def check_if_admin
    redirect_to(root_path) if @auth.nil? || !@auth.is_admin?
  end
end
