class BadgeType < ActiveRecord::Base
  has_many :badges
  has_many :badge_types, :through => :badges
end
