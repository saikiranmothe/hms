class AddAttachmentToGoalPost < ActiveRecord::Migration
  def change
  	add_attachment :goal_posts, :photo
  	add_attachment :fitnesses, :photo
  end
end
