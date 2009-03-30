class DeliveriesController < ApplicationController
  before_filter :login_required, :except => :index
  helper_method :all

  def new
    @delivery = Delivery.new
  end

  def create
    d = Delivery.new({:when => params[:delivery][:when], :user_id => current_user.id})
    if(d.save)
      flash[:notice] = 'You delivery has been reserved'
      render :action => :index
    else
      render :action => :edit
    end
  end
end
