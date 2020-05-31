class FriendshipsController < ApplicationController
  def create
    friend = User.find(params[:friend])
    current_user.friendships.build(friend_id: friend.id)
    if current_user.save(validate: false)
      flash[:success] = "Following friend"
    else
      flash[:alert] = "There was something wrong with the tracking request"
    end
    redirect_to my_friends_path
  end

  # todo flashの表示方法を色々変えて追加したい
  def destroy
    friendship = current_user.friendships.where(friend_id: params[:id]).first
    friendship.destroy
    flash[:info] = "Stopped following"
    redirect_to my_friends_path
  end

end
