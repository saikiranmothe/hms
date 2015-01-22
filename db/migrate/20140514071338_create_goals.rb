class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.integer :user_id
      t.string :number_name
      t.boolean :use_number
      t.boolean :use_photo
      t.boolean :use_words
      t.float :number_goal
      t.boolean :use_goal_date
      t.date :goal_date
      t.string :text
      t.string :category
      t.string :name

      t.timestamps
    end
  end
end
