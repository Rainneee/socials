class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :tweet, counter_cache: :bookmarks_counter

  validates :user_id, uniqueness: { scope: :tweet_id }
end
