require File.dirname(__FILE__) + '/../test_helper'

class ProducerSectionTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  def test_producer_sections_for_producer
    assert_equal 3, Producer.find(:first).producer_sections.length
  end
end
