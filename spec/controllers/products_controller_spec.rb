require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
include AuthenticatedTestHelper

describe ProductsController, "with new" do

  before do
    create_mocks
  end

  it "should respond to new for admin" do
    get :new, :producer_id => 1
    response.should render_template :edit
  end

  it "should respond to new for producer" do
    @producer.stub!(:name).and_return('Fred')
    @producer.stub!(:user).and_return stub_login_as('Fred')
    get :new, :producer_id => 1
    response.should render_template :edit
  end

  it "should respond with redirect for plonky" do
    @producer.stub!(:user).and_return 'Fred'
    stub_login_as('plonky')
    get :new, :producer_id => 1
    response.should be_redirect
  end

  it "should create new product on new" do
    Product.should_receive(:new).and_return(@product)
    get :new, :producer_id => 1
  end

#  it "should render show after create" do
#    post :create
#    response.should render_template :show
#  end

end

private 

def create_mocks
    @producer = mock_model(Producer)
    @product = mock_model(Product)
    @producer.stub!(:products).and_return([])
    @producer.stub!(:save).and_return(true)
    Producer.stub!(:find).and_return(@producer)
    @producer.stub!(:user).and_return stub_login_as('admin')
end
