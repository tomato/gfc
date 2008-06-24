class ProducerSection < ActiveRecord::Base
  belongs_to :producer
  
  def not_null_image
    image || "noimage.jpg"
  end
end
