class AddIsPrivateToCondition < ActiveRecord::Migration
  def change
  	add_column :conditions, :make_public, :boolean
  end
end
