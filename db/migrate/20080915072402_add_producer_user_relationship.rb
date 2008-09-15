class AddProducerUserRelationship < ActiveRecord::Migration
  def self.up
    add_column :producers, :user_id, :integer
  end

  def self.down
    remove_column :producers, :user_id
  end
end
