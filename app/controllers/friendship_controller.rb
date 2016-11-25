class FriendshipController < ApplicationController

  def add

    @user = User.find(params[:id])
    current_user.request_friend(@user)

  end

  def accept

    @user = User.find(params[:id])
    #@user.request_friend(current_user)
    current_user.accept_request(@user)

  end

  def decline

    @user = User.find(params[:id])
    current_user.decline_request(@user)

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
