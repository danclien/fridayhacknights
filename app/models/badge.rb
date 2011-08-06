class Badge < ActiveRecord::Base
  belongs_to :badge_type
  belongs_to :hacker
end
