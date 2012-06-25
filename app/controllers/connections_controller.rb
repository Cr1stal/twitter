class ConnectionsController < ApplicationController
  def create
    @user = User.find(params[:connection][:followed_id])
    current_user.follow!(@user)
    redirect_to @user
  end

  def destroy
    @user = Connection.find(params[:id]).followed
    current_user.unfollow!(@user)
    redirect_to @user
  end
end
