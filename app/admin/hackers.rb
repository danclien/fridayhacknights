ActiveAdmin.register Hacker do
  index do
    %w{id email name skills website}.each {|c| column c.to_sym }
  end
end
