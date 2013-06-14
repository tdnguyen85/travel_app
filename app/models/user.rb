class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :bio, :current_location, :first_name, :goal, :home_base, :last_name, :mood
  has_many :trips, inverse_of: :user

  has_many :friendships
  has_many :friends, :through => :friendships
  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user

  has_many :companionships
  has_many :companions, :through => :companionships
  has_many :inverse_companionships, :class_name => "Companionship", :foreign_key => "companion_id"
  has_many :inverse_companions, :through => :inverse_companionships, :source => :user

  include Gravtastic
  gravtastic

  acts_as_tagger
  acts_as_taggable

  validates :email, :presence => true
  validates :email, :uniqueness => true
end
