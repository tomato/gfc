class AddStatusToProducer < ActiveRecord::Migration
  def self.up
    add_column :producers, :status, :string, :null => false, :default => "draft"
  end

  def self.down
    remove_column :producers, :status
  end
end
