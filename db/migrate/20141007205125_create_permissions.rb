class CreatePermissions < ActiveRecord::Migration
  def change
    create_table :permissions do |t|
      t.integer :user_id
      t.integer :permissible_user_id
      t.integer :condition_id
      t.integer :goal_id

      t.timestamps
    end
  end
end
