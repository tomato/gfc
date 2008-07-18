module ImageHelper

  def gfc_image_tag (image, name)
    "<img src='#{ image_path(image.id.to_s) }' alt='" + name + "'>"
  end

end
