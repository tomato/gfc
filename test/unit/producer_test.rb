require File.dirname(__FILE__) + '/../test_helper'

class ProducerTest < ActiveSupport::TestCase
  fixtures :producers

  def test_truth
    assert true
  end

  def test_get
    assert_equal 3, Producer.get(3).length
  end

  def test_main_image
    producer = Producer.find(:first)
    assert_not_nil producer.not_null_image, "Main Image not found"
  end

  def test_empty_main_image
    p = Producer.new()
    assert_not_nil p.not_null_image
    assert_equal 'noimage.jpg', p.not_null_image, "i=" + p.not_null_image
  end
end
