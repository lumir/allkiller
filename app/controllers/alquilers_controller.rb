class AlquilersController < ApplicationController

  def index
    @alquilers = Alquiler.all
  end

  def show
    @alquiler = Alquiler.find(params[:id])
  end

  def new
    @availables = Alquiler.get_available(Date.today)
    @alquiler = Alquiler.new  
  end

  def create
    @alquiler = Alquiler.new(params[:alquiler])
    if @alquiler.save
      flash[:success] = "Alquiler grabado"
      redirect_to root_path
    else
      flash[:error] = "Hay algun error en los datos"
      render "new"
    end
  end

  def edit
    @alquiler = Alquiler.find(params[:id])    
  end

  def update
    @alquiler = Alquiler.find(params[:id])
    if @alquiler.update_attributes(params[:alquiler])
      flash[:success] = "Alquiler grabado"
      redirect_to root_path
    else
      flash[:error] = "Hay algun error en los datos"
      render "edit"
    end
  end  

  def destroy
    @alquiler = Alquiler.find(params[:id])
    @alquiler.destroy
    flash[:success] = "Alquiler grabado"
    redirect_to root_path    
  end
end
