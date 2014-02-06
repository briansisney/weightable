class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @weights = Weight.weight_records(@user)
    @weight = Weight.new
    @comment = Comment.new
    @bmi = User.bmi(@user)
    @bmi_translation = User.bmi_translate(@bmi)
    @chart_headers = Weight.chart_headers(@weights)
    @chart_data = Weight.chart_data(@weights)
  end

  def index
    @users = User.all
  end
end
