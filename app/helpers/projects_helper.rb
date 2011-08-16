module ProjectsHelper

  def checkin_description(checkin)
    return 'Checked in.' unless checkin.description.present?
    checkin.description
  end
end
