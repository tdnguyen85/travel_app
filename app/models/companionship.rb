class Companionship < ActiveRecord::Base
  attr_accessible :companion_id, :user_id
  belongs_to :user
  belongs_to :companion, :class_name => "User"
end
