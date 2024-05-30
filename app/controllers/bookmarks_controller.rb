class BookmarksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_tweet, only: [:create, :destroy]

  def index
    @tweets = current_user.bookmarked_tweets
  end

  def create
    @bookmark = current_user.bookmarks.create(tweet: @tweet)
    respond_to do |format|
      format.html {redirect_back(fallback_location: request.referer)}
      format.turbo_stream
    end
  end

  def destroy
    @bookmark = @tweet.bookmarks.find_by(id: params[:id])
    @bookmark.destroy
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
