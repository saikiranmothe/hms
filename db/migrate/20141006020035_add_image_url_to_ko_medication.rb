class AddImageUrlToKoMedication < ActiveRecord::Migration
  def change
    add_column :ko_medications, :imageurl, :string
  end
end
