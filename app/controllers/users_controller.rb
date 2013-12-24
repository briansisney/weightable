class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end
  def personal
    @user= current_user
    @weights=Weight.all
  end
end
