require File.dirname(__FILE__) + '/../test_helper'

class ImageTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  def test_initialize
    uploaded_image = Object.new
    def uploaded_image.content_type 
      "image" 
    end
    def uploaded_image.read 
      "fish" 
    end

    image = Image.new 
    image.uploaded_picture = uploaded_image
    assert_equal "image", image.content_type
    assert_equal "fish", image.data
  end
end
