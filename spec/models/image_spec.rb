require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Image do
  before(:each) do
    @image = Image.new
  end

  it "should be invalid without an attachment" do
    @image.should_not be_valid
  end
end
