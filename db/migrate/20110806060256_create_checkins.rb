class CreateCheckins < ActiveRecord::Migration
  def self.up
    create_table :checkins do |t|
      t.references :event
      t.references :hacker
      t.references :project
      # description of what the hacker did
      t.string :description

      t.timestamps
    end
  end

  def self.down
    drop_table :checkins
  end
end
