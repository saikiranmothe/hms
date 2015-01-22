class Post < ActiveRecord::Base
  belongs_to :condition
	belongs_to :user
	has_one :user, through: :condition
	has_attached_file :upload, styles: {
    		large: "800x800>", small: "260x180>"
  	}
  	attr_accessor :upload_file_name
end
