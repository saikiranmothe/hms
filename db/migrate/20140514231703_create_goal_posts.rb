class CreateGoalPosts < ActiveRecord::Migration
  def change
    create_table :goal_posts do |t|
      t.integer :user_id
      t.text :words
      t.float :number

      t.timestamps
    end
  end
end
