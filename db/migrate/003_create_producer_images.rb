class CreateProducerImages < ActiveRecord::Migration
  def self.up
    create_table :producer_images do |t|
      t.integer :producer_id, :sequence, :null => false
      t.string :alt_text, :name
      t.timestamps
    end
  end

  def self.down
    drop_table :producer_images
  end
end
