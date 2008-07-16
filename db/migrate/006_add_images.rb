class AddImages < ActiveRecord::Migration
  def self.up
    #create image table to hold image in db
    #potentially this could move to a seperate db server, 
    #give it its own model and controller
    create_table :images do |t|
      t.column :content_type, :string
      t.column :data, :binary, :limit => 1.megabyte
      t.references :section, :polymorphic => true
    end

    remove_column :producers, :image
    remove_column :producer_sections, :image
  end

  def self.down
    drop_table :images
    add_column :producers, :image, :string
    add_column :producer_sections, :image, :string
    remove_column :producers, :image_id
    remove_column :producer_sections, :image_id
  end
end
