class Project < ActiveRecord::Base
  belongs_to :owner, :class_name => 'Hacker'
  
  has_many :checkins
  has_many :events, :through => :checkins
  has_many :hackers, :through => :checkins

  validates :owner_id, :presence => true

  def hackers_involved
    # rails bug. See https://github.com/rails/rails/issues/2078#issuecomment-1603743
    # 
    # Should be:
    #   self.hackers.select('DISTINCT hackers.id')
    # 
    # Need to cardcode for now =/
    Hacker.find_by_sql('SELECT DISTINCT "hackers".* FROM "hackers"
                        INNER JOIN "checkins" ON "hackers".id = "checkins".hacker_id
                        WHERE (("checkins".project_id = ' + self[:id].to_s + '))')
  end
end
