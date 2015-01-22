class CreateFitnesses < ActiveRecord::Migration
  def change
    create_table :fitnesses do |t|
      t.integer :user_id
      t.string :activity

      t.timestamps
    end
  end
end
