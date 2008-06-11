class Producer < ActiveRecord::Base
  has_many :producer_images, :order => "sequence"
  
  def main_image
    producer_images.find(:first)
  end
end
