class AddGoalIdToGoalPosts < ActiveRecord::Migration
  def change
  	add_column :goal_posts, :goal_id, :integer
  end
end
