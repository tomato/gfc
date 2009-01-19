require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/../factories')

describe BasketItem do
  it "should show the total price" do
    bi = BasketItem.new([Factory(:variant, :price => 1.33).id, 2])
    bi.total_price.should eql(2.66)
  end
end
