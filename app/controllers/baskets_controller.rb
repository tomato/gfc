class BasketsController < ApplicationController
  before_filter :get_basket



  private 
  def get_basket
    @basket = session[:basket] ||= Basket.new
  end
end
