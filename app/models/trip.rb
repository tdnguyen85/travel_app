class Trip < ActiveRecord::Base
  attr_accessible :begin_on, :end_on, :like, :title, :user_id, :cities_attributes
  belongs_to :user, inverse_of: :trips
  has_many :cities, inverse_of: :trip
  accepts_nested_attributes_for :cities, allow_destroy: true
  acts_as_commentable
end
