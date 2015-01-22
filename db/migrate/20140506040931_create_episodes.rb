class CreateEpisodes < ActiveRecord::Migration
  def change
    create_table :episodes do |t|
      t.integer :user_id
      t.string :name
      t.text :description

      t.timestamps
    end
    add_index :episodes, :user_id
  end
end
