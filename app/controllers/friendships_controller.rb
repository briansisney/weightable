class FriendshipsController < ApplicationController
  def create
    @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
    if @friendship.save
      redirect_to :back, notice: "Added friend."
    else
      redirect_to :back, notice: "Unable to add friend."
    end
  end

  def destroy
    @friendship = Friendship.where(user_id: current_user).where(friend_id: params[:id]).first
    @friendship.destroy
    redirect_to root_url, notice: "Removed friendship."
  end

  private
 
end
