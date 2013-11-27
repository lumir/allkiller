class AlquilersController < ApplicationController

  def index
    @availables = Alquiler.get_available(Date.today)
    #@alquilers = Alquiler.where(:deliver_date => Date.today)
    @alquilers = Alquiler.all
  end

  def show
    @alquiler = Alquiler.find(params[:id])
  end

  def new
    @availables = Alquiler.get_available(Date.today)
    @alquiler = Alquiler.new(deliver_date: Date.today) 
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
    @availables = Alquiler.get_available(@alquiler.deliver_date)
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


  #TODO create specific controllers
  def get_availables    
    @availables = Alquiler.get_available(params[:selected_date])    
    respond_to do |format|      
      format.js
    end
  end

  def search
    @availables = Alquiler.get_available(params[:selected_date])
    @alquilers = Alquiler.where(:deliver_date => params[:selected_date])
    respond_to do |format|      
      format.js
    end
  end
end
