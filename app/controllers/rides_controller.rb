class RidesController < ApplicationController
  def create
    @rider = Rider.find(params[:rider_id])
    @ride = @rider.rides.create(ride_params)
    redirect_to rider_path(@rider)
  end
  
  def index
    @riders = Rider.all
    @driver = Driver.find_by(uid: session[:current_user_id])
  end
  
  def destroy
    @rider = Rider.find(params[:rider_id])
    @ride = @rider.rides.find(params[:id])
    @ride.destroy
    redirect_to rider_path(@rider)
  end
  
  def accept
    @ride = Ride.find(params[:id])
    @driver =  Driver.find_by(uid: session[:current_user_id])
    @ride.update(accepted: true)
    @ride.update(driver_id: @driver.id)

    redirect_to driver_path(@driver)
  end
  
  private
  def ride_params
    params.require(:ride).permit(:id, :rider_id, :origin, :destination, :timeAndDate)
  end
end
 