class Condition < ActiveRecord::Base
	belongs_to :user
	has_many :posts
	belongs_to :page
	has_many :medications, through: :trackers
	has_many :trackers
	#has_many :sages, 
	#validates :page_id, presence: true

	def self.search(search)
  		where('name LIKE?', "%#{search}%")
  	end
  
  def page_name
    @page = Page.find(page_id)
    return @page.name
  end
end
