class City < ActiveRecord::Base
  attr_accessible :country, :name, :trip_id, :iteneraries_attributes
  belongs_to :trip, inverse_of: :cities
  has_many :iteneraries, inverse_of: :city
  accepts_nested_attributes_for :iteneraries, allow_destroy: true, reject_if: :all_blank
end
