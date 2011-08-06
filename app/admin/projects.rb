ActiveAdmin.register Project do
  index do
    %w{id owner title website}.each {|c| column c.to_sym }
  end
end
