require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Variant do
  before(:each) do
    @variant = Variant.new
  end

  it "should be valid" do
    @variant.should be_valid
  end
end
