module ImageHelpers

  def image_path
    if(image && image.public_filename)
      image.public_filename
    else
      'noimage.jpg'
    end
  end
  
  def uploaded_data=(value)
      self.image = Image.new({:uploaded_data => value}) unless(value.blank?)
  end

end
