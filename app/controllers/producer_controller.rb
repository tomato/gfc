class ProducerController < ApplicationController

  def list
    @producers = Producer.find(:all)
  end

  def edit
    @producer = Producer.find(params[:id])
    @producer.update_attributes(params[:producer]) if(params[:producer])
    flash[:notice] = "You've been updated"
  end
end
