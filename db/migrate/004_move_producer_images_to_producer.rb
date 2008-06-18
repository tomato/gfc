class MoveProducerImagesToProducer < ActiveRecord::Migration
  def self.up
    add_column :producers, :image, :string
  end

  def self.down
    remove_column :producers, :image
  end
end
