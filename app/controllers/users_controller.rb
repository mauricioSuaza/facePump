class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @friends = @user.friends
    @added = false
    @alreadyFriends = false
    @friendRequests = current_user.requested_friends
    @pendings = current_user.pending_friends
    @pendings.each do |pend|
        if pend== @user
            @added = true
        end
    end
    @friends.each do |friend|
        if current_user== friend
            @alreadyFriends = true
        end
    end


    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
    @user = User.find(params[:id])
  end


  def update

    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to users_path

  end

private

  def user_params
    params.require(:user).permit(:name, :email, :avatar, :avatar_cache, :id)
  end


end
