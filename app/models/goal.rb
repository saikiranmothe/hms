class Goal < ActiveRecord::Base
	belongs_to :user
	has_many :goal_posts


	   has_attached_file :asset, styles: {
    		large: "800x800>", medium: "300x200>", small: "260x180>", thumb: "80x80#"
  	}

  	def self.search(search)
  		where('name LIKE?', "%#{search}%")
  	end

  	def mark_completed
  		update_attribute(:completed, true)
  	end

  	def self.get_completed
  		self.where(completed: true)
  	end

  	def self.get_unfinished
  		self.where(completed: false)
  	end
end
