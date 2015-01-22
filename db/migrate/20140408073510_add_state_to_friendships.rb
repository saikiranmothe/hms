class AddStateToFriendships < ActiveRecord::Migration
  def change
  	add_column :friendships, :state, :string
  	add_index :friendships, :state
  end
end
