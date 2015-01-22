class AddDonerStatusToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :doner, :boolean
  	remove_column :users, :gender, :string
  	add_column :users, :gender, :boolean
  	add_column :users, :phone_number, :string
  end
end
