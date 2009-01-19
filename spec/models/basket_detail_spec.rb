require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/../factories')

describe BasketDetail do
  before(:each) do
    @basket = Basket.new
    @v = Factory(:variant)
    @basket.add @v, 1
  end

  it "should accept a basket as a contructor" do
    bd = BasketDetail.new @basket
  end

  it "should contain a collection of BasketItems" do 
    bd = BasketDetail.new @basket
    bd.items[0].should be_kind_of BasketItem
  end

  it "should show the total price" do
    basket = Basket.new
    basket.add Factory(:variant, :price => 2.36), 2
    basket.add Factory(:variant, :price => 1.10), 1
    bd = BasketDetail.new basket
    bd.total_quantity.should eql(3)
    bd.total_price.should eql(5.82)
  end

end
