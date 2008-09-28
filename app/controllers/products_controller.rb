class ProductsController < ApplicationController
  before_filter :find_producer

  def new
    @product = Product.new
    render :action => "edit"
  end

  def create
    @producer.products << Product.new(params[:product])
    if(@producer.save)
      redirect_to producer_products_url(@producer)
    else
      render :action => :edit
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def index
    @products = Product.find(:all)
  end

  private
  def find_producer
    @producer_id = params[:producer_id]
    return(redirect_to(producers_url)) unless @producer_id
    @producer = Producer.find(@producer_id)
  end
    

end
