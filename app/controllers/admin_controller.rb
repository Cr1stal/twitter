class AdminController < ApplicationController
  def index
    Rails.logger.add(session[:user_id])
    @tweets = current_user.tweets.reverse
    @followed_users = current_user.followeds
    @followed_users.each do |user|
      @tweets.concat(user.tweets)
    end
    @tweets = @tweets.sort.reverse.compact

    @total_tweets = current_user.tweets.count
    @tweet = Tweet.new
  end
end
