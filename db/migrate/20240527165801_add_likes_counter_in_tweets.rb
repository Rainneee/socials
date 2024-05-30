class AddLikesCounterInTweets < ActiveRecord::Migration[7.1]
  def change
    add_column :tweets, :likes_counter, :integer, null: :false, default: 0
  end
end
