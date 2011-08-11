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

    checkin = Checkin.create \
      :hacker => current_hacker,
      :project_id => params[:id],
      :event => Event.current,
      :description => params[:description]

    if checkin.errors.length > 0
      puts "Checkin create errors: #{checkin.errors.inspect}"
      return show! :notice => "You've already checked into this project."
    else
      return show! :notice => "Checked in successfully."
    end
  end
end
