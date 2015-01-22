class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.integer :user_id
      t.integer :specialist_id
      t.string :name
      t.text :notes
      t.datetime :start_date
      t.datetime :end_date
      t.string :location

      t.timestamps
    end
  end
end
