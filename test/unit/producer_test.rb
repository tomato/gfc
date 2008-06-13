require File.dirname(__FILE__) + '/../test_helper'

class ProducerTest < ActiveSupport::TestCase
  fixtures :producers, :producer_images

  def test_truth
    assert true
  end

  def test_get
    assert_equal 3, Producer.get(3).length
  end

  def test_images
    assert_equal 2,  Producer.find(:first).producer_images.count
  end

  def test_main_image
    producer = Producer.find(:first)
    assert_not_nil producer.main_image, "Main Image not found"
  end

  def test_empty_main_image
    producer = Producer.new(:name => "test", :summary => "test summary")
    assert_equal "noimage.jpg", producer.main_image.name
  end
end
