class CreateProjects < ActiveRecord::Migration
  def self.up
    create_table :projects do |t|
      t.references :owner

      t.string :title
      t.string :description
      t.string :website

      t.timestamps
    end
  end

  def self.down
    drop_table :projects
  end
end
