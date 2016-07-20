class TweetsController < ApplicationController
  include TweetsHelper
  before_action :signed_in_user
  def index
    @tweets = Tweet.where(user_id: current_user.id).order(created_at: :desc)
    @time_line = current_user.timeline
  end

  def new
    @tweet = Tweet.new
  end

  def my_tweets
    @my_tweets = current_user.my_tweets(current_user)
  end

  def create
    @tweet = Tweet.new(tweets_param)
    @tweet.user_id = current_user.id
    if @tweet.save
      redirect_to tweets_path
    else
      render new_tweet_path
    end
  end

  private

  def tweets_param
    params.require(:tweet).permit(:body)
  end
end
