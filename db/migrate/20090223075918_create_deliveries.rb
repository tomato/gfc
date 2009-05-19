class CreateDeliveries < ActiveRecord::Migration
  def self.up
    create_table :deliveries do |t|
      t.datetime :when
      t.timestamps
      t.references :user, :null => false
    end
  end

  def self.down
    drop_table :deliveries
  end
end
