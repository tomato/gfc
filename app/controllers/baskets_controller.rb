class BasketsController < ApplicationController

  def index

  end

  def create

  end

  def add_to_basket
    @basket.add(params[:variant_id], params[:quantity])
    respond_to {|f| f.js}
  end

  def destroy

  end
end
