class FriendshipController < ApplicationController

  def add

    @user = User.find(params[:id])

    current_user.friend_request(@user)

    redirect_to :back
  end

  def accept

    @user = User.find(params[:id])
    current_user.accept_request(@user)
    redirect_to :back

  end

  def decline

    @user = User.find(params[:id])
    current_user.decline_request(@user)
    redirect_to :back

  end

  def remove

    @user = User.find(params[:id])
    current_user.remove_friend(@user)

  end

  def block

    @user = User.find(params[:id])
    current_user.block_friend(@user)

  end

end
