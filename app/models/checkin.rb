class Checkin < ActiveRecord::Base
  belongs_to :event
  belongs_to :hacker
  belongs_to :project

  validates :event, :presence => true
  validates :hacker, :presence => true
  validates :project, :presence => true
end
