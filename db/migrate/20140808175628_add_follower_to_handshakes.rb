class AddFollowerToHandshakes < ActiveRecord::Migration
  def change
  	remove_column :handshakes, :user_id, :integer
  	remove_column :handshakes, :other_id, :integer
  	add_column :handshakes, :follower_id, :integer
  	add_column :handshakes, :followed_id, :integer

  	add_index :handshakes, :follower_id
  	add_index :handshakes, :followed_id
  	add_index :handshakes, [:follower_id, :followed_id], unique: true
  end
end
