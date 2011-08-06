class Checkin < ActiveRecord::Base
  belongs_to :event
  belongs_to :hacker
  belongs_to :project
end
