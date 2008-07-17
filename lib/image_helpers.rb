module ImageHelpers

  def not_null_image
    image || Image.find(1)
  end

end
