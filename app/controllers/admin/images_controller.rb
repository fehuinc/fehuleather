class Admin::ImagesController < ApplicationController
  def index
    @images = Image.all
  end
  
  def new
    @image = Image.new
    @data = s3_presigned_post_data
  end
  
  def create
    @image = Image.new(standard_params)
    if @image.save
      flash[:success] = "Saved"
      redirect_to admin_images_path
    else
      @data = s3_presigned_post_data
      render :new
    end
  end
  
  def edit
    @image = Image.find(params[:id])
    @data = s3_presigned_post_data
  end
  
  def update
    @image = Image.find(params[:id])
    @image.update(standard_params)
    if @image.save
      flash[:success] = "Saved"
      redirect_to admin_images_path
    else
      @data = s3_presigned_post_data
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
  
  def s3_presigned_post_data
    bucket = Aws::S3::Resource.new.bucket(ENV["S3_BUCKET"])
    post = bucket.presigned_post(
      allow_any: ['key'],
      success_action_status: "201",
      acl: "public-read"
      )
    
    data = {
      fields: post.fields,
      host: URI.parse(post.url).host,
      url: post.url
    }
  end
  
end
