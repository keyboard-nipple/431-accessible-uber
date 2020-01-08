class DriverController < ApplicationController
    def index
    @drivers = Driver.all
  end
  
  def show
    @driver = Driver.find(params[:id])
  end
  
  def new
    if Driver.exists?(uid: auth_hash["uid"])
      @driver = Driver.find_by(uid: auth_hash["uid"])
      redirect_to @driver
    else
      @driver = Driver.new
      @user_info = auth_hash
    end
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
    @driver = Driver.find(params[:id])
    if @driver.update(driver_params)
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
    params.require(:driver) .permit(:uid, :name, :email, :zip_code, :dob)
  end

  def auth_hash
    request.env['omniauth.auth']
  end
end
