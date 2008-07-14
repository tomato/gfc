class AddImages < ActiveRecord::Migration
  def self.up
    #create image table to hold image in db
    #potentially this could move to a seperate db server, 
    #give it its own model and controller
    create_table :images do |t|
      t.column :content_type, :string
      t.column :data, :binary, :limit => 1.megabyte
    end

    add_column :producers, :image_id, :integer
    remove_column :producers, :image
    add_column :producer_sections, :image_id, :integer
    remove_column :producer_sections, :image
  end

  def self.down
    drop_table :images
    remove_column :producers, :image_id
    add_column :producers, :image, :string
    remove_column :producer_sections, :image_id
    add_column :producer_sections, :image, :string
  end
end
