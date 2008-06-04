class BrowseController < ApplicationController

  def index
    @producers = Producer.find(:all)
  end
end
