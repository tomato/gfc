class ProducersController < ApplicationController
  helper :image

  def index
    @producers = Producer.get(6)
  end

  def show
    @producer = Producer.find(params[:id])
  end

  def list
    @producers = Producer.find(:all)
  end

  def new

  end

  def create

  end

  def update
    @producer = Producer.find(params[:id])
    @producer.update_attributes(params[:producer]) if(params[:producer])
    flash[:notice] = "You've been updated"
    redirect_to(@producer)
  end

  def edit
    @producer = Producer.find(params[:id])
  end
end
