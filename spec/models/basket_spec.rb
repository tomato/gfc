require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/../factories')

describe Basket do
  before(:each) do
    @basket = Basket.new
    @v = Factory(:variant)
  end

  it "should accept a valid variant" do
    @basket.add @v
    @basket.total_quantity.should eql(1)
  end

  it "should not add a non persisted variant" do
    lambda{ @basket.add Variant.new}.should raise_error
    @basket.total_quantity.should eql(0)
  end

  it "should hold multiple items" do
    @basket.add @v
    @basket.add Factory(:variant, :description => "tims2"), 2
    @basket.items.count.should eql(2)
    @basket.total_quantity.should eql(3)
  end

  it "should add a specific quantity to a basket" do
    @basket.add @v, 2
    @basket.total_quantity.should eql(2)
  end

  it "should add a specific string quantity to a basket" do
    @basket.add @v, "2"
    @basket.total_quantity.should eql(2)
  end

  it "should add a spefic string quantity to an existing item" do
    @basket.add @v, "2"
    @basket.add @v, "2"
    @basket.total_quantity.should eql(4)
  end

  it "should accept an int for a variant key" do
    @basket.add @v.id, 2
    @basket.total_quantity.should eql(2)
  end

  it "should accept a string for a variant key" do
    @basket.add @v.id.to_s, 2
    @basket.total_quantity.should eql(2)
  end


  it "should remove a specifc quantity from a basket item" do
    @basket.add @v, 3
    @basket.remove @v, 1
    @basket.total_quantity.should eql(2)
  end

  it "should throw exception if quantity of an item is negative" do
    lambda{ @basket.remove(@v, 1) }.should raise_error(ArgumentError)
    @basket.total_quantity.should eql(0)
  end

  it "should amend quantity where the item already exists" do
    @basket.add @v ,1
    @basket.add @v ,2
    @basket.total_quantity.should eql(3)
  end

  it "should update the quantity of a variant" do
    @basket.add @v
    @basket.update_quantity @v, 2
    @basket.total_quantity.should eql(2)
  end

  it "should raise error if quantity is set to negative when updating quantity" do
    @basket.add @v
    lambda{ @basket.update_quantity @v, -1}.should raise_error
  end

  it "should remove variant if quantity is 0" do
    @basket.add @v
    @basket.remove @v
    @basket.items.should_not have_key @v.id
  end

  it "should be marshallable" do
    @basket.add @v
    data = Marshal.dump @basket
    b2 = Marshal.load data
    b2.should be_kind_of Basket
    b2.total_quantity.should eql(1)
  end
end
