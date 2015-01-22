class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :name
      t.text :description
      t.string :page_type

      t.timestamps
    end
  end
end
