class Project < ActiveRecord::Base
  belongs_to :owner, :class_name => 'Hacker'
  
  has_many :events, :through => :checkins
  has_many :hackers, :through => :checkins

  validates :owner_id, :presence => true
end
