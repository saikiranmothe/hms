class AddPageIdToCondition < ActiveRecord::Migration
  def change
  	add_column :conditions, :page_id, :integer
  end
end
