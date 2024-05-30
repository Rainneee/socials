class TweetsController < ApplicationController
  before_action :authenticate_user!

  def index
    @tweets = Tweet.includes(:user).order(created_at: :desc)
  end

  def show
    @current_tweet = Tweet.find(params[:id])
    TwitterView.create(user: current_user, tweet: @current_tweet) unless current_user.twitter_views.exists?(user: current_user, tweet: @current_tweet)
    @reply_tweets = @current_tweet.reply_tweets.includes(:liked_users, :retweeted_users, :bookmarked_users, :viewed_users).order(created_at: :desc)
  end

  def create
    @tweet = Tweet.new(tweet_params.merge(user_id: current_user.id))

    if @tweet.save
      Rails.logger.debug "Tweet saved successfully."
      respond_to do |format|
        format.html do
          Rails.logger.debug "Responding with HTML format."
          redirect_back(fallback_location: request.referer)
        end
        format.turbo_stream do
          Rails.logger.debug "Responding with Turbo Stream format."
        end
      end
    else
      Rails.logger.debug "Failed to save tweet."
      respond_to do |format|
        format.html do
          Rails.logger.debug "Rendering new with HTML format."
          render :new
        end
        format.turbo_stream do
          Rails.logger.debug "Rendering new with Turbo Stream format."
        end
      end
    end
  end 

  # def comment_modal
  #   @tweet_parent = Tweet.find_by(id: params[:id])
  #   Rails.logger.debug "Tweet Params: #{@tweet_parent.attributes.inspect}"
  #   respond_to do |format|
  #     format.turbo_stream
  #   end
  # end 

  private

  def tweet_params
    params.require(:tweet).permit(:body, :parent_id)
  end
end
