class WeightsController < ApplicationController
  before_action :set_weight, only: [:show, :edit, :update, :destroy]
  def show
  end

  def edit
  end

  def index
    @weights = Weight.all
    @weight = Weight.new
    @comment = Comment.new
    # @comments = Comments.all
  end

  def update
    if @weight.user == current_user
      respond_to do |format|
        if @weight.update(weight_params)
          format.html { redirect_to @weight, notice: 'weight was successfully updated.' }
        else
          format.html { render action: 'edit' }
        end
      end
    else
      respond_to do |format|
          format.html { redirect_to @weight, notice: 'you cannot edit other users weights.' }
      end
    end
  end

  def new
    @weight = Weight.new
  end

  def create
    @weight = Weight.new(weight_params)
    @weight.user = current_user
    respond_to do |format|
      if @weight.save
        format.html { redirect_to weights_path, notice: 'weight was successfully created.' }
        format.js { render layout: false }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def destroy
    if @weight.user == current_user
      @weight.destroy
      respond_to do |format|
        format.html { redirect_to weights_url }
        # format.js { render layout: false }
      end
    end
  end



  private
  def set_weight
    @weight = Weight.find(params[:id])
  end
  def weight_params
    params.require(:weight).permit(:date, :weight, :pic, :attachment)
  end
end
