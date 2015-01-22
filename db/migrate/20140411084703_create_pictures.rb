class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
    	t.references :album
    	t.references :user
     	t.string :caption
     	t.text :description

      t.timestamps
  end
  add_index :pictures, :album_id
  add_index :pictures, :user_id
  add_attachment :pictures, :asset
  end
end
