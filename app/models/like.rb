class Like < ApplicationRecord
  belongs_to :user
  belongs_to :tweet, counter_cache: :likes_counter

  validates :user_id, uniqueness: { scope: :tweet_id }
end
