class Event < ActiveRecord::Base
  has_many :hackers
  has_many :projects
end
