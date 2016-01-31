class StoresController < ApplicationController
  def auth
    cookies[:stores_auth] = "ME"
    redirect_to stores_path
  end
  
  def index
    @models = Store.all
  end
  
  def new
    @model = Store.new
  end
  
  def create
    @model = Store.new(standard_params)
    if @model.save
      redirect_to stores_path
    else
      render :new
    end
  end
  
  def edit
    @model = Store.find(params[:id])
  end
  
  def update
    if @model = Store.find(params[:id]).update(standard_params)
      redirect_to stores_path
    else
      render :edit
    end
  end
  
  def destroy
    render json: Store.find(params[:id]).destroy!
  end
  
private
  
  def standard_params
    params.require(:store).permit :name, :store_name, :email, :phone, :notes
  end

end
