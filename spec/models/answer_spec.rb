require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Answer do
  before(:each) do
    @answer = Answer.new
  end

  it "should be valid with valid attributes" do
    @answer.attributes = valid_answer_attributes
    @answer.should be_valid
  end

  it "should error if text length is below 100" do
     @answer.attributes = valid_answer_attributes.with(:text => "a"*99)
     @answer.should_not be_valid
     @answer.should have(1).error_on(:text)
     @answer.errors[:text].should include "is too short"
  end

  private

  def valid_answer_attributes
    {
      :text => "x"*101
    }
  end
end
