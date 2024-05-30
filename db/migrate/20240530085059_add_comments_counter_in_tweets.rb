class AddRepliesCounterInTweets < ActiveRecord::Migration[7.1]
  def change
    add_column :tweets, :replies_counter, :integer, null: :false, default: 0
  end
end
