class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @weights = Weight.all
    @weight = Weight.new
    @comment = Comment.new
  end

  def index
    @users = User.all
  end
end
