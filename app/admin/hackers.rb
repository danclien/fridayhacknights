ActiveAdmin.register Hacker do
  index do
    column :id do |record|
      link_to record[:id], admin_hacker_path(record)
    end
    %w{email name skills website}.each {|c| column c.to_sym }
  end
end
