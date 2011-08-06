class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.string :gallery_url

      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
