require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Recipe do
  before(:each) do
    @recipe = Recipe.new
  end

  it "should not be valid" do
    @recipe.should_not be_valid
  end

  it "should be valid with a name and description" do
    @recipe.name = "tom"
    @recipe.description = "blah blah blah"
    @recipe.should be_valid
  end
end
