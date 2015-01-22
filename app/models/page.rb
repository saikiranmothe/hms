class Page < ActiveRecord::Base
	has_many :users
	belongs_to :user
	#has_many :conditions

	has_many :conditions
	has_many :users, through: :conditions
end
