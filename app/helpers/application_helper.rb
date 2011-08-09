module ApplicationHelper

  def hacker_list(hackers)
    render :partial => 'hackers/item-list', :locals => { :hackers => hackers }
  end

  def project_list(projects)
    render :partial => 'projects/item-list', :locals => { :projects => projects }
  end
end
