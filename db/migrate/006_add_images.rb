class AddImages < ActiveRecord::Migration
  def self.up
    #create image table to hold image in db
    #potentially this could move to a seperate db server, 
    #give it its own model and controller
    create_table :images do |t|
      t.column :size, :integer
      t.column :content_type, :string
      t.column :filename, :string
      t.column :height, :integer
      t.column :width, :integer
      t.references :section, :polymorphic => true
      
    end

    #Image.create :content_type => "image/jpeg", :data => IO.read("#{RAILS_ROOT}/public/images/noimage.jpg")
    
    remove_column :producers, :image
    remove_column :producer_sections, :image
  end

  def self.down
    drop_table :images
    add_column :producers, :image, :string
    add_column :producer_sections, :image, :string
  end
end
