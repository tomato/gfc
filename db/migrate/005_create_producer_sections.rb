class CreateProducerSections < ActiveRecord::Migration
  def self.up
    create_table :producer_sections do |t|
      t.integer :producer_id, :null => false
      t.string :name, :summary, :null => false
      t.string :image
      t.timestamps
    end
  end

  def self.down
    drop_table :producer_sections
  end
end
