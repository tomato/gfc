module ImageHelper

  def gfc_image_tag (image, name)
    "<img src='/resource/picture/" + image.id.to_s + "' alt='" + name + "'>"
  end

end
