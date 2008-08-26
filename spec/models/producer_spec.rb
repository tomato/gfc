require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Producer do
  before(:each) do
    @producer = Producer.new
  end

  it do
    @producer.should_not be_valid
  end
  
  it do
    @producer.attributes = valid_producer_attributes
    @producer.should be_valid
  end

  it "should require name" do
    @producer.should have_at_least(1).error_on(:name)
  end

  it "should error if name is not unique" 

  it "should error if email is not valid" do
    @producer.attributes = valid_producer_attributes.with(:email => "grrr")
    @producer.should_not be_valid
    @producer.should have(1).error_on(:email)
    @producer.errors[:email].should include "is invalid"
  end

  it "should error if website is not valid" do
    @producer.attributes = valid_producer_attributes.with(:website => "grrr")
    @producer.should_not be_valid
    @producer.should have(1).error_on(:website)
    @producer.errors[:website].should include "is invalid"
  end
  
  it "should error if name length is below 3" do
     @producer.attributes = valid_producer_attributes.with(:name => "a"*2)
     @producer.should_not be_valid
     @producer.should have(1).error_on(:name)
     @producer.errors[:name].should include "is too short"
  end

  it "should error if name length is greater than 50" do
     @producer.attributes = valid_producer_attributes.with(:name => "a"*51)
     @producer.should_not be_valid
     @producer.should have(1).error_on(:name)
     @producer.errors[:name].should include "is too long"
  end

  it "should error if summary length is below 20" do
     @producer.attributes = valid_producer_attributes.with(:summary => "a"*19)
     @producer.should_not be_valid
     @producer.should have(1).error_on(:summary)
     @producer.errors[:name].should include "is too short"
  end

  it "should error if summary length is greater than 100" do
     @producer.attributes = valid_producer_attributes.with(:name => "a"*101)
     @producer.should_not be_valid
     @producer.should have(1).error_on(:summary)
     @producer.errors[:name].should include "is too long"
  end

  private

  def valid_producer_attributes
    {
      "name"=>"Toms tomatoes", 
      "address"=>"The village hall\r\nWitham\r\nEssex\r\nCM8 3df", 
      "created_at"=>"Mon Aug 11 08:44:51 +0100 2008", 
      "updated_at"=>"Mon Aug 11 08:44:51 +0100 2008", 
      "tel"=>"4324280 08080980", 
      "id"=>1, 
      "website"=>"www.tomstomatoes.com", 
      "summary"=>"growing ripe red juic tomatoes", 
      "email"=>"tom@tomstomatoes.com"
    }
  end
end
