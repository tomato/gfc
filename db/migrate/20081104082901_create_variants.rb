class CreateVariants < ActiveRecord::Migration
  def self.up
    create_table :variants do |t|
      t.string :description, :null => false  
      t.decimal :price, :null => false
      t.boolean :available, :null => false 
      t.references :product, :null => false
      t.timestamps
    end
  end

  def self.down
    drop_table :variants
  end
end
