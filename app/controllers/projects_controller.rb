class ProjectsController < InheritedResources::Base
  before_filter :authenticate_hacker!, :except => [:index, :show]

  def show
    show! do
      @hacker_is_owner = current_hacker == @project.owner
    end
  end

  def create
    @project = Project.new params[:project]
    @project.owner = current_hacker
    create!
  end
end
