class GoalPost < ActiveRecord::Base
	belongs_to :goal

	has_attached_file :photo, styles: {
	    large: "800x800>", medium: "300x200>", small: "260x180>", thumb: "80x80#"
	  }
end
