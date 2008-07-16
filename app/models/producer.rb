class Producer < ActiveRecord::Base
  has_many :producer_sections
  has_one :image, :as => :section
  
  def not_null_image
    image || Image.new[:id => 1]
  end

  def Producer.get(num)
    Producer.find(:all, :limit => num)
  end

  def uploaded_image=(image_field)
    i = Image.new
    i.uploaded_picture = image_field
    self.image = i
  end

end
