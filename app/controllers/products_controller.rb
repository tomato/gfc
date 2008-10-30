class ProductsController < ApplicationController
  before_filter :find_producer
  before_filter :login_required, :except => [:index, :show]

  def new
    @product = Product.new
    render :action => "edit"
  end

  def create
    @producer.products << Product.new(params[:product])
    if_save { @producer.save }
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    find_product
    if_save {@product.update_attributes(params[:product])}
  end

  def destroy
    find_product
    if_save(:view){ @product.destroy}
  end

  def show
    find_product
  end

  private
  def find_producer
    @producer_id = params[:producer_id]
    return(redirect_to(producers_url)) unless @producer_id
    @producer = Producer.find(@producer_id)
  end

  def find_product
    @product = Product.find(params[:id])
  end

  def if_save(action = :edit)
    if(yield)
       redirect_to producer_url(@producer)
    else
      render action
    end
  end
    
  def authorized?
    can_edit?
  end
end
