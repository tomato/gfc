require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Recipe do
  before(:each) do
    @recipe = Recipe.new
  end

  it "should be valid" do
    @recipe.should be_valid
  end
end
