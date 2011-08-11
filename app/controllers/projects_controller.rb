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

    hacker_id = current_hacker.owns?(project) ? params[:hacker_id] : current_hacker[:id]

    checkin = Checkin.find_or_create_by_hacker_id_and_event_id_and_project_id(
      hacker_id, Event.current[:id], project[:id]
    )


    checkin.update_attribute :description, params[:description]

    if checkin.errors.length > 0
      puts "Checkin create errors: #{checkin.errors.inspect}, #{project.inspect}"
      return show! :notice => "You've already checked into this project."
    elsif checkin.new_record?
      return show! :notice => "Checked in successfully."
    else
      return show! :notice => "Description updated successfully."
    end
  end

  def check_out
    project = Project.find params[:id]

    if project.nil?
      return show! :alert => 'Invalid project'
    end

    # TODO: delete checkin

    return show! :notice => "Chilled out successfully."
  end
end
