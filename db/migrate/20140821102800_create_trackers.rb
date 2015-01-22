class CreateTrackers < ActiveRecord::Migration
  def change
    create_table :trackers do |t|
      t.integer :user_id
      t.integer :condition_id
      t.integer :medication_id

      t.timestamps
    end
  end
end
