class Hacker < ActiveRecord::Base
  has_many :owned_projects, :class_name => :project
  
  has_many :checkins
  has_many :events, :through => :checkins
  has_many :projects, :through => :checkins

  has_many :badges
  has_many :badge_types, :through => :badges

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :name, :skills, :website

  validates :name, :presence => true, :length => 3..20

  def projects_involved
    # rails bug. See https://github.com/rails/rails/issues/2078#issuecomment-1603743
    # 
    # Should be:
    #   self.projects.select('DISTINCT projects.id')
    # 
    # Need to hardcode for now =/
    Hacker.find_by_sql('SELECT DISTINCT "projects".* FROM "projects"
                        INNER JOIN "checkins" ON "projects".id = "checkins".project_id
                        WHERE (("checkins".hacker_id = ' + self[:id].to_s + '))')
  end
end
