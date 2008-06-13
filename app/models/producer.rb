class Producer < ActiveRecord::Base
  has_many :producer_images, :order => "sequence"
  
  def main_image
    producer_images.find(:first) || ProducerImage.new(:sequence => 1, :name => 'noimage.jpg')
  end

  def Producer.get(num)
    p = Producer.find(:all, :limit => num)
    # we need to find randomly
  end
end
