module ImageHelpers

  def not_null_image
    if(image && image.public_filename) 
      image.public_filename
    else
      'noimage.jpg'
    end
  end

end
