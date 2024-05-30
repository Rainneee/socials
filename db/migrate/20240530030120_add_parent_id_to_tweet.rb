class AddParentIdToTweet < ActiveRecord::Migration[7.1]
  def change
    add_column :tweets, :parent_id, :integer
  end
end
