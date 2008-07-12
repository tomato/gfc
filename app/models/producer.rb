class Producer < ActiveRecord::Base
  has_many :producer_sections
  
  def not_null_image
    image || 'noimage.jpg'
  end

  def Producer.get(num)
    Producer.find(:all, :limit => num)
    # we need to find randomly
  end

  def uploaded_image=(image_field)
    write_attribute(:image, File.basename(image_field.original_filename))
    logger.info("image is " + image)
  end

end
