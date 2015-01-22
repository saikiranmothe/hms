class CreateUserFriendships < ActiveRecord::Migration
  def change
    create_table :user_friendships do |t|
      t.integer :user_id
      t.integer :friend_id

      t.timestamps
    end
    add_column :user_friendships, :state, :string
    add_index :user_friendships, :state
    add_index :user_friendships, [:user_id, :friend_id]
  end
end
