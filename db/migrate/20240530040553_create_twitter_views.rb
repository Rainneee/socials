class CreateTwitterViews < ActiveRecord::Migration[7.1]
  def change
    create_table :twitter_views do |t|
      t.references :user, null: false, foreign_key: true
      t.references :tweet, null: false, foreign_key: true

      t.index [:user_id, :tweet_id], unique: true

      t.timestamps
    end

    add_column :tweets, :views_counter, :integer, null: :false, default: 0
  end
end
