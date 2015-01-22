class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.integer :user_id
      t.text :content

      t.timestamps
    end
    add_index :statuses, :user_id
  end
end
