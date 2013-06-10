class Favorite < ActiveRecord::Base
  attr_accessible :favorite_type, :trip_id, :user_id
end
