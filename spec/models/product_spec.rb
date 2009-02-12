require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Product do
  before(:each) do
    @product = Product.new({:name => 'tom', :description => 'thumb'})
  end

  it "should be valid" do
    @product.should be_valid
  end
end
