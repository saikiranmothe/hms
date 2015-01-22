class AddConditionIdToPosts < ActiveRecord::Migration
  def change
  	remove_column :posts, :episode_id, :integer
  	add_column :posts, :condition_id, :integer
  end
end
