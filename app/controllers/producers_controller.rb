class ProducersController < ApplicationController
  helper :image

  def index
    @producers = Producer.get(6)
  end

  def show
    @producer = Producer.find(params[:id])
  end

  def new
    @producer = Producer.new
    render :action => "edit"
  end

  def create
    @producer = Producer.new(params[:producer])
    @producer.image = Image.new(params[:image]) if(params[:image])
    if(@producer.save)
      flash[:notice] = 'Your details have been saved'
      redirect_to(@producer)
    else
      render :action => "edit"
    end

  end

  def update
    @producer = Producer.find(params[:id])
    @producer.image = Image.new(params[:image]) if(params[:image][:uploaded_data].length > 0)

    if(@producer.update_attributes(params[:producer]))
      flash[:notice] = "You've been updated"
      redirect_to(@producer)
    else
      render :action => "edit"
    end
  end

  def edit
    @producer = Producer.find(params[:id])
  end
end
