class CreateConnections < ActiveRecord::Migration
  def change
    create_table :connections do |t|
      t.integer :follower_id
      t.integer :followed_id

      t.timestamps
    end
  end
end
