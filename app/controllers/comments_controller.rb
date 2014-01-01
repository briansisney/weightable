class CommentsController < ApplicationController
  before_action :set_weight
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  def new
    @comment = Comment.new
    @weight = Weight.where(id: params["weight_id"]).take
  end

  def show

  end

  def edit

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
        format.html { redirect_to weights_path(@weight), notice: 'comment was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def update
    
  end
  def destroy
    
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
