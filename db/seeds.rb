# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

first_event = Event.create \
  :start_date => DateTime.new(2011, 8, 6, 20),
  :end_date   => DateTime.new(2011, 8, 7, 10)

bob = Hacker.create \
  :name => 'Bob',
  :email => 'bob@gmail.com',
  :password => '123123',
  :password_confirmation => '123123'

fnh_project = Project.create \
  :owner => bob,
  :name => "Friday Night Hacks Official Website",
  :description => "A Friday Night Hacks meta project Actually we're making Google (see the url? it's true).",
  :website => 'http://google.com'
