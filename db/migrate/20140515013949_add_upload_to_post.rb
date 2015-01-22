class AddUploadToPost < ActiveRecord::Migration
  def change
  	add_attachment :posts, :upload
  end
end
