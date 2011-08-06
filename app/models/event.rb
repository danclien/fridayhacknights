class Event < ActiveRecord::Base
  has_many :hackers, :through => :checkins
  has_many :projects, :through => :checkins
end
