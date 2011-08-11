class Event < ActiveRecord::Base
  has_many :checkins
  has_many :hackers, :through => :checkins
  has_many :projects, :through => :checkins

  validates :start_date, :presence => true
  validates :end_date, :presence => true

  def self.next_active
    Event.where("active=:active AND end_date >= :current_date", 
        {:active => true, :current_date => DateTime.now})
      .order("start_date")
      .limit(1)
      .first
  end
  
  def self.last_active
    Event
      .where("active=:active AND start_date <= :current_date", 
        {:active => true, :current_date => DateTime.now})
      .order("start_date DESC")
      .limit(1)
      .first
  end

  def self.current
    next_active || last_active || Event.last
  end
end
