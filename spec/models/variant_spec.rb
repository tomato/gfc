require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Variant do
  before(:each) do
    @variant = Variant.new({:description => 'big', :price => 1.2})
  end

  it "should be valid" do
    @variant.should be_valid
  end

  it "should only accept a decimal price" do
    @variant.price = 'tom'
    @variant.should_not be_valid
  end
end
