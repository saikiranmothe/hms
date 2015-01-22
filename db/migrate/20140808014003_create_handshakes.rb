class CreateHandshakes < ActiveRecord::Migration
  def change
    create_table :handshakes do |t|
      t.integer :user_id
      t.integer :other_id
      t.string :relationship_name
      t.string :relationship_type

      t.timestamps
    end
  end
end
