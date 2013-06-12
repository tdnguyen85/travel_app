class Trip < ActiveRecord::Base
  attr_accessible :begin_on, :end_on, :like, :title, :user_id, :cities_attributes, :body, :tag_list
  belongs_to :user, inverse_of: :trips
  has_many :cities, inverse_of: :trip
  accepts_nested_attributes_for :cities, allow_destroy: true, reject_if: :all_blank
  # acts_as_commentable
  acts_as_taggable
  has_many :comments, as: :commentable
end
