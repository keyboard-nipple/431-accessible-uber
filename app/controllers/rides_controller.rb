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
  
  def accept
    puts "helo"
    @ride = Ride.find(ride_params[:id])
    @ride.update(accepted: true)
  end
  
  private
    def ride_params
      params.require(:ride).permit(:id, :origin, :destination)
    end
end
