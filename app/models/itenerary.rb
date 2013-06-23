class Itenerary < ActiveRecord::Base
  attr_accessible :activity_to_do, :item, :place_to_eat, :place_to_sleep, :act_on, :city_id
  belongs_to :city, inverse_of: :iteneraries

  validates_presence_of :item
  validates_presence_of :city_id

end
