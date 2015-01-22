class CreateHeights < ActiveRecord::Migration
  def change
    create_table :heights do |t|
      t.integer :user_id
      t.float :amount

      t.timestamps
    end
  end
end
