class CreateKoMedications < ActiveRecord::Migration
  def change
    create_table :ko_medications do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
