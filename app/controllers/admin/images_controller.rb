class Admin::ImagesController < ApplicationController
  def index
    @images = Image.all
  end
  
  def new
    @image = Image.new
  end
  
  def create
    @image = Image.new(standard_params)
    if @image.save
      flash[:success] = "Saved"
      redirect_to admin_images_path
    else
      render :new
    end
  end
  
  def edit
    @image = Image.find(params[:id])
  end
  
  def update
    @image = Image.find(params[:id])
    @image.update(standard_params)
    if @image.save
      flash[:success] = "Saved"
      redirect_to admin_images_path
    else
      render :edit
    end
  end
  
  def destroy
    render json: Image.find(params[:id]).destroy!
  end
  
private
  
  def standard_params
    params.require(:image).permit(:src)
  end
  
end
