class Friendship < ActiveRecord::Base
	belongs_to :user
	belongs_to :friend, :class_name => "User"

	state_machine :state, initial: :pending do
		event :accept do
			transition any => :accepted
		end
	end
	
end
