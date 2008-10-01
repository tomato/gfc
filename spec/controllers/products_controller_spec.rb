require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ProductsController do

  before do
    @producer = mock_model(Producer)
    @product = mock_model(Product)
    @producer.stub!(:products).and_return([])
    @producer.stub!(:save).and_return(true)
  end

  it "should respond to new" do
    get :new
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
