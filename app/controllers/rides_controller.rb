class RidesController < ApplicationController
  def create
    @rider = Rider.find(params[:rider_id])
    @ride = @rider.rides.create(ride_params)
      redirect_to rider_path(@rider)
  end
  
  private
    def ride_params
      params.require(:ride).permit(:origin, :destination)
    end
end
