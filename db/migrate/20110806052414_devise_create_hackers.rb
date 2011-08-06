class DeviseCreateHackers < ActiveRecord::Migration
  def self.up
    create_table(:hackers) do |t|
      t.string :name
      t.string :skills
      t.string :website

      # devise
      t.database_authenticatable :null => false
      t.recoverable
      t.rememberable
      t.trackable

      # t.encryptable
      # t.confirmable
      # t.lockable :lock_strategy => :failed_attempts, :unlock_strategy => :both
      # t.token_authenticatable


      t.timestamps
    end

    add_index :hackers, :email,                :unique => true
    add_index :hackers, :reset_password_token, :unique => true
    # add_index :hackers, :confirmation_token,   :unique => true
    # add_index :hackers, :unlock_token,         :unique => true
    # add_index :hackers, :authentication_token, :unique => true
  end

  def self.down
    drop_table :hackers
  end
end
