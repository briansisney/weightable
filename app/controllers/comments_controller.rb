class CommentsController < ApplicationController
  before_action :set_weight
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  def new
    @comment = Comment.new
    @weight = Weight.where(id: params["weight_id"]).take || Weight.last.id+1
  end

  def show

  end

  def edit
    # weight = Weight.where(id: params["weight_id"]).take
  end

  def index
    @comments = Comment.all
  end

  def create
    @comment = Comment.new(comment_params)
    # @weight = Weight.where(id: params["weight_id"]).take
    # @friend = @weight.user
    # @user = current_user
    respond_to do |format|
      if @comment.save
        format.html { redirect_to :back, notice: 'comment was successfully created.' }
        format.js { render layout: false, :locals => {weight_id: params[:weight_id]} }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def update
    if @comment.user == current_user
      respond_to do |format|
        if @comment.update(comment_params)
          format.html { redirect_to :back, notice: 'comment was successfully updated.' }
        else
          format.html { render action: 'edit' }
        end
      end
    else
      respond_to do |format|
          format.html { redirect_to :back, notice: 'you cannot edit other users comments.' }
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    # if @comment.user == current_user || @comment.weight.user == current_user
      respond_to do |format|  
        if @comment.destroy
          format.html { redirect_to :back,  notice: "weight was deleted"}
          format.js { render layout: false }
        else 
          format.html { redirect_to  :back, notice: "weight was not deleted"}
        end
      end
    # end
  end

  private
  def set_comment
    @comment = Comment.find(params[:id])
  end
  def set_weight
    @weight = Weight.where(id: params["weight_id"]).take
  end
  def comment_params
    params.require(:comment).permit(:comment, :weight_id, :user_id, :friend_id)
  end
end
