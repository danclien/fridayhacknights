class Event < ActiveRecord::Base
  has_many :checkins
  has_many :hackers, :through => :checkins
  has_many :projects, :through => :checkins

  validates :start_date, :presence => true
  validates :end_date, :presence => true

  def self.current
    # TODO: make sure this is the actual current event
    Event.last
  end
end
