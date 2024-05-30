class RepliesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_tweet

  def create
    @tweet = @parent_tweet.reply_tweets.create(tweet_params.merge(user_id: current_user.id))

    if @tweet.save
      respond_to do |format|
        format.html {redirect_back(fallback_location: request.referer)}
        format.turbo_stream
      end
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
    @parent_tweet = Tweet.find(params[:tweet_id])
  end

  def tweet_params
    params.require(:tweet).permit(:body, :parent_id)
  end
end
