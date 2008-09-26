class ProductsController < ApplicationController
  before_filter :find_producer

  def new
    @product = Product.new
    render :action => "edit"
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def index
  end

  private
  def find_producer
    @producer_id = params[:producer_id]
    return(redirect_to(producers_url)) unless @producer_id
    @producer = Producer.find(@producer_id)
  end
    

end
