class CreateExercises < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
    	 t.integer :user_id
      t.text :description
      t.string :type

      t.timestamps
    end
  end
end
