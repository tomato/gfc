class BrowseController < ApplicationController

  def index
    @producers = Producer.get(6)
  end

  def view
   # @producer = Producer.find(:id)
  end
end