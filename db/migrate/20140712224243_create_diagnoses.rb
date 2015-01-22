class CreateDiagnoses < ActiveRecord::Migration
  def change
    create_table :diagnoses do |t|
      t.integer :user_id
      t.integer :page_id

      t.timestamps
    end
  end
end
