class AddCorrectGenderToUser < ActiveRecord::Migration
  def change
  	remove_column :users, :gender, :boolean
  	add_column :users, :gender, :string
  	remove_column :users, :doner, :boolean
  	add_column :users, :doner, :string
  	add_column :users, :bloodtype, :string
  end
end
