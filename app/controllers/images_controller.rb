class ImagesController < ApplicationController
  def show
    @image = Image.find(params[:id])
    send_data(@image.data, :type => @image.content_type, :disposition => 'inline')
  end
end
