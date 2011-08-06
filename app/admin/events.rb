ActiveAdmin.register Event do
  index do
    column :id do |record|
      link_to record[:id], admin_event_path(record)
    end
    %w{start_date end_date gallery_url}.each {|c| column c.to_sym }
  end
end
