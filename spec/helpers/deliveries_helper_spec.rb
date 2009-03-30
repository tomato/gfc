require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe DeliveriesHelper do
  
  #Delete this example and add some real ones or delete this file
  it "should be included in the object returned by #helper" do
    included_modules = (class << helper; self; end).send :included_modules
    included_modules.should include(DeliveriesHelper)
  end

  it "should return a range of daily delivery slots" do
    daily_delivery_slots.should be_an_instance_of(Range)
  end

  it "should return a next avalaible day tomorrow if its before 2pm" do
    next_available_delivery(Time.now.midnight).should eql(Time.now.tomorrow.midnight)
  end

  it "should return a next available day of the day after next if its after 2pm" do
    next_available_delivery(Time.now.change(:hour => 15)).should eql(Time.now.advance(:days => 2).midnight)
  end

  it "should return 3 delivery days and the first will be tomorrow if the time is 1pm" do
    days = next_delivery_days(Time.now.midnight,3)
    puts days
    days.count.should eql(3)
    days.first.should eql(Time.now.tomorrow.midnight)
    days.last.should eql(Time.now.advance(:days => 3).midnight)
  end

end
