require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Answer do
  before(:each) do
    @answer = Answer.new
  end

  it "should be valid with valid attributes" do
    @answer.attributes = valid_answer_attributes
    @answer.should be_valid
  end

  private

  def valid_answer_attributes
    {
      :text => "x"*101
    }
  end
end
