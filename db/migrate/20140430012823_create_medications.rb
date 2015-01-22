class CreateMedications < ActiveRecord::Migration
  def change
    create_table :medications do |t|
      t.integer :user_id
      t.text :name
      t.text :dosage

      t.timestamps
    end

    add_index :medications, :user_id
  end
end
