class BasketsController < ApplicationController

  def index
    @basket_detail = BasketDetail.new @basket
  end

  def add_to_basket
    @basket.add(params[:variant_id], params[:quantity])
    respond_to {|f| f.js}
  end

  def edit_basket
    params[:basket_item].each do |key,value|
      @basket.update_quantity(key, value[:quantity])
    end

    @basket_detail = BasketDetail.new @basket
    respond_to {|f| f.js}
  end

end
