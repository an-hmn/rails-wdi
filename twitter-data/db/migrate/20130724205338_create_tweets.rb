class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.belongs_to :user
      t.text :post

      t.timestamps
    end
    add_index :tweets, :user_id
  end
end
