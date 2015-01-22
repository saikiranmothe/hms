class CreateDatapoints < ActiveRecord::Migration
  def change
    create_table :datapoints do |t|
      t.boolean :taken
      t.integer :tracker_id

      t.timestamps
    end
  end
end
