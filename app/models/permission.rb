class Permission < ActiveRecord::Base
  belongs_to :user
  belongs_to :permissible_user, class_name: "User"
end
