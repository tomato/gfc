class ProducerController < ApplicationController

  def list
    @producers = Producer.find(:all)
  end

  def edit
    @producer = Producer.find(params[:id])
  end
end
