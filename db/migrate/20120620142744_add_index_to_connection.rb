class AddIndexToConnection < ActiveRecord::Migration
  def self.up
    add_index :connections, :follower_id
    add_index :connections, :followed_id
    add_index :connections, [:follower_id, :followed_id], unique: true
  end

  def self.down
    remove_index :connections, :follower_id
    remove_index :connections, :followed_id
  end
end
