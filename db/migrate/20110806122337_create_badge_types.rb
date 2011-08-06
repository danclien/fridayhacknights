class CreateBadgeTypes < ActiveRecord::Migration
  def self.up
    create_table :badge_types do |t|
      t.string :name
      t.string :goal
      t.integer :rank

      t.timestamps
    end

    BadgeType.reset_column_information()
    [
      { :name => 'Endurance', :rank => 3,
        :goal => "Endure the entire length of the meetup." },
      { :name => 'Day Break', :rank => 2,
        :goal => "Hang in the hack night long enough to see the brink of dawn." },
      { :name => 'Unknown Cameo', :rank => 1,
        :goal => "Check in during a hack night." },
      { :name => 'Hacker Slacker', :rank => 0,
        :goal => "Check in when you're not actually here. Slack." },

      { :name => "I ain't flakin'", :rank => 2,
        :goal => "Create a project and check into it during two consecutive hack nights." },

      { :name => 'Bandwagon', :rank => 3,
        :goal => "Own a project with at least 3 other contributers." },

      { :name => 'Contributer', :rank => 1,
        :goal => "Contribute to another hacker's project." },
      { :name => 'Support', :rank => 2,
        :goal => "Contribute to another hacker's project during two consecutive hack nights." },
      { :name => 'Medic', :rank => 3,
        :goal => "Contribute to at least three different projects owned by other hackers." },
      
      { :name => 'All Hail da King', :rank => 3,
        :goal => "Finish a project you started during a hack night." }
    ].each do |data|
      BadgeType.create! data
    end
  end

  def self.down
    drop_table :badge_types
  end
end
