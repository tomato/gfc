class ProducersController < ApplicationController

  def index
    if(params[:status])
      @producers = Producer.get(6, params[:status])
    else
      @producers = Producer.get(6)
    end
  end

  def show
    @producer = Producer.find(params[:id])
  end

  def new
    @producer = Producer.new
    @producer.create_default_answers
    render :action => "edit"
  end

  def create
    if(Producer.transaction do
        @producer = Producer.new(params[:producer])
        @producer.create_answers(params[:answer])
        @producer.create_user(params[:user].merge(
          {:login => @producer.name,:email => @producer.email})) 
        @producer.save!
        end
      )
      flash[:notice] = 'Your details have been saved'
      redirect_to(@producer)
    else
      @questions = Question.find(:all)
      render :action => "edit"
    end

  end

  def update
    @producer = Producer.find(params[:id])
    @producer.attributes = params[:producer]
    @producer.update_answers(params[:answer])
    @producer.update_user(params[:user].merge(
        {:login => @producer.name,:email => @producer.email})) 

    if(@producer.save)
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
