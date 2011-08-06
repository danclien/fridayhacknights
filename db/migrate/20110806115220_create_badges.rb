class CreateBadges < ActiveRecord::Migration
  def self.up
    create_table :badges do |t|
      t.references :badge_type
      t.references :hacker

      t.timestamps
    end
  end

  def self.down
    drop_table :badges
  end
end
