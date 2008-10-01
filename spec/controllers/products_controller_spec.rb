require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
include AuthenticatedTestHelper

describe ProductsController do

  before do
    @producer = mock_model(Producer)
    @product = mock_model(Product)
    @producer.stub!(:products).and_return([])
    @producer.stub!(:save).and_return(true)
    Producer.stub!(:find).and_return(@producer)
    @producer.stub!(:user).and_return stub_login_as('admin')
  end

  it "should respond to new" do
    get :new, :producer_id => 1
    response.should render_template :edit
  end

#  it "should create new product on new" do
#    Product.should_receive(:new).and_return(@product)
#    get :new
#  end

#  it "should render show after create" do
#    post :create
#    response.should render_template :show
#  end

end
