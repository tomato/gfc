require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/../factories')

describe Basket do
  before(:each) do
    @basket = Basket.new
  end

  it "should accept a valid product" do
    @basket.add Factory(:product)
    @basket.count.should eql(1)
  end


end
