class Event < ActiveRecord::Base
  has_many :hackers, :through => :checkins
  has_many :projects, :through => :checkins

  validates :start_date, :presence => true
  validates :end_date, :presence => true
end
