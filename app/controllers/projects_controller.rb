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

  def check_in
    project = Project.find params[:id]

    if project.nil?
      return show! :alert => 'Invalid project'
    end

    # TODO: check for existing checkin

    checkin = Checkin.create \
      :hacker => current_hacker,
      :project_id => params[:id],
      # TODO: make sure this is the actual current event
      :event => Event.last

    if checkin.errors.length > 0
      puts "Checkin create errors: #{checkin.errors.inspect}"
      redirect_to project_path(project), :notice => "You've already checked into this project."
    else
      redirect_to project_path(project), :notice => "Checked in successfully."
    end
  end
end
