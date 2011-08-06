ActiveAdmin.register Event do
  index do
    %w{id start_date end_date gallery_url}.each {|c| column c.to_sym }
  end
end
