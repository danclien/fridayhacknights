class Project < ActiveRecord::Base
  has_one :owner, :class_name => :hacker
  
  has_many :events, :through => :checkins
  has_many :hackers, :through => :checkins

  validates :owner, :presence => true
end
