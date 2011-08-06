class Hacker < ActiveRecord::Base
  has_many :owned_projects, :class_name => :project
  
  has_many :events, :through => :checkins
  has_many :projects, :through => :checkins

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :name, :skills, :website

  validates :name, :presence => true
end
