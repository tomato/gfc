class ProducerSection < ActiveRecord::Base
  belongs_to :producer
  belongs_to :image
  
  def not_null_image
    image || "noimage.jpg"
  end
end
