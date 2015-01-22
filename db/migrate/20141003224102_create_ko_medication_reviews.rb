class CreateKoMedicationReviews < ActiveRecord::Migration
  def change
    create_table :ko_medication_reviews do |t|
      t.string :title
      t.text :description
      t.integer :user_id
      t.boolean :is_anonymous
      t.integer :rating
      t.integer :condition_id

      t.timestamps
    end
  end
end
