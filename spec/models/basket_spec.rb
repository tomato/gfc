require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/../factories')

describe Basket do
  before(:each) do
    @basket = Basket.new
    @p = Factory(:product)
  end

  it "should accept a valid product" do
    @basket.add @p
    @basket.total_quantity.should eql(1)
  end

  it "should not add a non persisted product" do
    lambda{ @basket.add Product.new}.should raise_error
    @basket.total_quantity.should eql(0)
  end

  it "should add a specific quantity to a basket" do
    @basket.add @p, 2
    @basket.total_quantity.should eql(2)
  end

  it "should add a specific string quantity to a basket" do
    puts @p.id
    @basket.add @p, "2"
    @basket.total_quantity.should eql(2)
  end

  it "should accept an int for a product key" do
    @basket.add @p.id, 2
    @basket.total_quantity.should eql(2)
  end

  it "should accept a string for a product key" do
    @basket.add @p.id.to_s, 2
    @basket.total_quantity.should eql(2)
  end


  it "should remove a specifc quantity from a basket item" do
    @basket.add @p, 3
    @basket.remove @p, 1
    @basket.total_quantity.should eql(2)
  end

  it "should throw exception if quantity of an item is negative" do
    lambda{ @basket.remove(@p, 1) }.should raise_error(ArgumentError)
    @basket.total_quantity.should eql(0)
  end

  it "should amend quantity where the item already exists" do
    @basket.add @p ,1
    @basket.add @p ,2
    @basket.total_quantity.should eql(3)
  end

  it "should update the quantity of a product" do
    @basket.add @p
    @basket.update_quantity @p, 2
    @basket.total_quantity.should eql(2)
  end

  it "should raise error if quantity is set to negative when updating quantity" do
    @basket.add @p
    lambda{ @basket.update_quantity @p, -1}.should raise_error
  end

  it "should remove product if quantity is 0" do
    @basket.add @p
    @basket.remove @p
    @basket.items.should_not have_key @p.id
  end
end
