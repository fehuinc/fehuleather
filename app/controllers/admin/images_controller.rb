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
      redirect_to edit_admin_image_path(@image)
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
      redirect_to edit_admin_image_path(@image)
    else
      render :edit
    end
  end
  
  def destroy
    Image.find(params[:id]).destroy
    redirect_to admin_images_path
  end
  
private
  
  def standard_params
    params.require(:image).permit(:src)
  end

end
