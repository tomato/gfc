require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Delivery do
  before(:each) do
    @delivery = Delivery.new
  end

  it "should be valid" do
    @delivery.should be_valid
  end
end
