require File.dirname(__FILE__) + '/../spec_helper'
include AuthenticatedTestHelper

describe ProducersController , "handling edit" do
  
  def do_get
    get "edit", :id =>1
  end
  
  before do
    @producer = mock_model(Producer, :name => 'test')
    @producer.stub!(:user).and_return stub_user("test user")
    Producer.stub!(:find).and_return(@producer)
  end

  it "show edit if admin" do
    stub_login_as('admin') 
    do_get
    response.should render_template 'edit'
  end

  it "show edit if user is associated with producer" do
    @producer.stub!(:user).and_return stub_login_as('producers user')
    do_get
    response.should render_template 'edit'
  end

  it "should not show edit if user is not admin or producer" do
    stub_login_as 'plonky'
    do_get
    response.should be_redirect
  end

  it "should not show edit if not logged in" do
    do_get
    response.should be_redirect
  end
end

describe ProducersController, "Handling index" do

  before do
    @producers = []
    6.times {@producers << mock_model(Producer)}
  end

  it "should render index" do
    Producer.should_receive(:get).with(6).and_return(@producers)
    get "index" 
    response.should render_template :index
  end

  it "should render index with active producers if not admin" do
    Producer.should_receive(:get).with(6).and_return(@producers)
    get "index", :status => :draft
    response.should render_template :index
  end
    
  it "should render index with draft producers if admin" do
    stub_login_as('admin') 
    Producer.should_receive(:get).with(6, :draft).and_return(@producers)
    get "index", :status => :draft
    response.should render_template :index
  end
end
