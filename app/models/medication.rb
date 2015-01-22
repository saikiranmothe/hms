class Medication < ActiveRecord::Base
	belongs_to :user
	belongs_to :condition

	def self.search(search)
  		where('name LIKE?', "%#{search}%")
  	end
end
