class BasketsController < ApplicationController

  def index
    @basket_detail = BasketDetail.new @basket
  end

  def add_to_basket
    @basket.add(params[:variant_id], params[:quantity])
    respond_to {|f| f.js}
  end

  def edit_basket
    @basket.update_quantity(params[:variant_id], params[:quantity])
    @basket_detail = BasketDetail.new @basket
    respond_to {|f| f.js}
  end

end
