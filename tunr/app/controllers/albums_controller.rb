class AlbumsController < ApplicationController
  before_filter :check_if_admin, :only => [:new, :create, :edit, :update]

  def index
    @albums = Album.order(:name)
  end

  def new
    @album = Album.new
  end

  def create
    @album = Album.new(params[:album])
    if @album.save
      redirect_to(albums_path)
    else
      @obj = @album
      render :new
    end
  end

  def edit
    @album = Album.find(params[:id])
    render :new
  end

  def update
    @album = Album.find(params[:id])
    if @album.update_attributes(params[:album])
      redirect_to(albums_path)
    else
      @obj = @album
      render :new
    end
  end

  private
  def check_if_admin
    redirect_to(root_path) if @auth.nil? || !@auth.is_admin?
  end

end
