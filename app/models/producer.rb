class Producer < ActiveRecord::Base
  
  def not_null_image
    image || 'noimage.jpg'
  end

  def Producer.get(num)
    Producer.find(:all, :limit => num)
    # we need to find randomly
  end
end
