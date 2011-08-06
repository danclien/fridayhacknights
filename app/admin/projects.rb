ActiveAdmin.register Project do
  index do
    column :id do |record|
      link_to record[:id], admin_project_path(record)
    end
    %w{owner name website}.each {|c| column c.to_sym }
  end
end
