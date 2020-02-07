class DriversController < ApplicationController
  def index
    @drivers = Driver.all
  end
  
  def show
    @driver = Driver.find(params[:id])
  end
  
  def new
    @driver = Driver.new
  end
  
  def edit
    @driver = Driver.find(params[:id])
  end
  
  def create
    @driver = Driver.new(driver_params)
    if @driver.save
      redirect_to @driver
    else
      render 'new'
    end
  end
  
  def update
    puts params[:certification]
    @driver = Driver.find(params[:id])
    if @driver.update(driver_params)
      @driver.certification.attach(params[:certification])
      redirect_to @driver
    else
      render 'edit'
    end
  end
  
  def destroy
    @driver = Driver.find(params[:id])
    @driver.destroy
    redirect_to drivers_path
  end
  
  private
  def driver_params
    params.require(:driver) .permit(:uid, :name, :email, :license, :dob, :certification)
  end
end
