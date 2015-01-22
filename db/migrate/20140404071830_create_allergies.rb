class CreateAllergies < ActiveRecord::Migration
  def change
    create_table :allergies do |t|
      t.integer :user_id
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
