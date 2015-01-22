class AddProfileInfoToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :gender, :string
  	add_column :users, :language, :string
  	add_column :users, :ethnicity, :string
  	add_column :users, :address, :text
  end
end
