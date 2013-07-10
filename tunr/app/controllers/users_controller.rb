class UsersController < ApplicationController
  def index
    @users = @auth.is_admin? ? User.all : []
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to(root_path)
    else
      render :new
    end
  end

  def edit
    @user = @auth
    render :new
  end

  def update
    @user = @auth
    if @user.update_attributes(params[:user])
      redirect_to(root_path)
    else
      render :new
    end
  end

  def destroy
    if @auth.is_admin?
      user = User.find(params[:id])
      user.destroy
    end
    redirect_to(users_path)
  end
end
