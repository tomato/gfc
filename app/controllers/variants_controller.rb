class VariantsController < ApplicationController
  before_filter :find_producer_and_product, :find_variant
  before_filter :login_required

  def new
    render :action => "edit"
  end

  def create
    @product.variants << @variant
    if_save{ @product.save }
  end

  def edit
  end

  def update
    if_save { @variant.update_attributes(params[:variant]) }
  end

  def destroy
    if_save { @variant.destroy }
  end

  private
  def find_producer_and_product
    @producer = Producer.find(params[:producer_id])
    @product = Product.find(params[:product_id])
  end

  def find_variant
    @variant = if params[:id] 
                 Variant.find(params[:id]) 
               elsif params[:variant]
                 Variant.new(params[:variant])
               else
                 Variant.new
               end
  end
  
  def if_save(action = :edit)
    if(yield)
       redirect_to producer_product_url(@producer,@product)
    else
      render action
    end
  end
    
  def authorized?
    can_edit?
  end
end
