class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
    @user.collections.build#.build_game
  end

  def edit
    @user = User.find(params[:id])
  end


  def create
    @user = User.create(params[:user])
    @user.collection = Collection.create(params[:collection])
    @user.collections.build.build_game
    if @user.save
      redirect_to @user, notice: 'User was successfully created.'
    else
      render action: "new" 
    end
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(params[:user])
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render action: "edit" 
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
  end

end
