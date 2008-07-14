class Producer < ActiveRecord::Base
  has_many :producer_sections
  belongs_to :image
  
  def not_null_image
    image || 'noimage.jpg'
  end

  def Producer.get(num)
    Producer.find(:all, :limit => num)
  end

  def uploaded_image=(image_field)
    i = Image.new
    i.uploaded_picture = image_field
  end

end
