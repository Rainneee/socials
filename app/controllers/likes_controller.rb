class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_tweet, only: [:create, :destroy]
  
  def index
    @tweets = current_user.liked_tweets
  end

  def create
    @like = current_user.likes.create(tweet: @tweet)
    respond_to do |format|
      format.html {redirect_back(fallback_location: request.referer)}
      format.turbo_stream
    end
  end

  def destroy
    @like = @tweet.likes.find_by(id: params[:id])
    @like.destroy
    respond_to do |format|
      format.html {redirect_back(fallback_location: request.referer)}
      format.turbo_stream
    end
  end

  private

  def set_tweet
    @tweet = Tweet.find(params[:tweet_id])
  end
end
