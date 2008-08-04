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
    assert_not_nil producer.image_path, "Main Image not found"
  end

  def test_empty_main_image
    p = Producer.new()
    assert_not_nil p.image_path
    assert_equal 'noimage.jpg', p.image_path, "i=" + p.image_path
  end

  #Validation Tests
  def test_first_fixture_valid
    p = Producer.find(:first)
    assert p.valid?, p.errors.each.to_s
  end

  def test_invalid_with_empty_attributes
    p = Producer.new
    assert !p.valid?
    assert p.errors.invalid?(:name)
    assert p.errors.invalid?(:summary)
    assert p.errors.invalid?(:address)
    assert p.errors.invalid?(:email)
    assert p.errors.invalid?(:tel)
  end
  
  def test_uniqueness_of_name
    p1 = get_jimmy
    p2 = Producer.new(:name => p1.name)
    assert !p2.valid?
    assert p2.errors.invalid?(:name)
  end
  
  def test_dodgy_email_invalid
    p = get_jimmy
    p.email = "not a very good email"
    assert !p.valid?
    assert p.errors.invalid?(:email)
  end

  def test_dodgy_website_invalid
    p = get_jimmy
    p.website = "a a "
    assert !p.valid?
    assert p.errors.invalid?(:website)
  end

  def test_summary_to_short
    p = get_jimmy
    p.summary = "a"
    assert !p.valid?
    assert p.errors.invalid?(:summary)
  end

  #Create question test
  def test_create_default_answers
    p = Producer.new
    p.create_default_answers
    assert_equal Question.find(:all).length, p.answers.length
  end
  
  def test_create_answers
#    answers = {"1" => {"text" => "First Answer"}, "2" => {"text" => "Second Answer"}}
    answers = [{"text" => "First Answer"},{"text" => "second"}]
    p = Producer.new
    p.create_answers answers
    assert_equal 2, p.answers.length
  end

  def test_update_answers
    #original_answer = {"answer" => {"1" => {:text => "First Answer"}}}
    #updated_answer = {"answer" => {"1" => {:text => "updated Answer"}}}
    #p = Producer.new
    #p.create_answers original_answer
    #p.update_answers updated_answer
    #assert_equal original_answer, p.answer[0].text 
  end
  private

  def get_jimmy
    p = Producer.find(:first)
    assert p.valid?
    p
  end



end
