class ImagesController < ApplicationController
  def index
    @image = Image.new
  end
    
  def create
    @image = Image.new(image_params)
 
    if @image.save
      render :index
    else
      render :index
    end
  end
    
  def update
  end
    
  def destroy
  end
    
  private
  def image_params
    params.require(:image).permit(:image)
  end
end
