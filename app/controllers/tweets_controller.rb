class TweetsController < ApplicationController
  def index
    @tweets = Tweet.find_by_user_id(1)
  end

  def new
    @tweet = Tweet.new
  end

  def show
  end

  def create
    @tweet = Tweet.new(params[:tweet])
    @tweet.user_id = session[:user_id]

    if @tweet.save
      redirect_to admin_path
    else
      render :action => "new"
    end
  end

  def destroy
  end
end
