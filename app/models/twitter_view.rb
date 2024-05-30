class TwitterView < ApplicationRecord
  belongs_to :user
  belongs_to :tweet, counter_cache: :views_counter

  validates :user_id, uniqueness: { scope: :tweet_id }
end
