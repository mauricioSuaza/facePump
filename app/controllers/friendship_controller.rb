class FriendshipController < ApplicationController

  def add
    
    @user = User.find(params[:id])

    current_user.request_friend(@user)

  end

  def accept

  end

  def decline

  end

  def remove

  end

  def block

  end

end
