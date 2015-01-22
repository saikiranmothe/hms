class CreateWeights < ActiveRecord::Migration
  def change
    create_table :weights do |t|
      t.integer :user_id
      t.float :amount

      t.timestamps
    end
  end
end
