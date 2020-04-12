class RidesController < ApplicationController
  def create
    @rider = Rider.find(params[:rider_id])
    @ride = @rider.rides.create(ride_params)
    redirect_to rider_path(@rider)
  end
  
  def index
    @riders = Rider.all
    @driver = Driver.find_by(uid: session[:current_user_id])
    order_rides
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
  
  def complete_as_driver
    @ride = Ride.find(params[:id])
    @driver =  Driver.find_by(uid: session[:current_user_id])
    @ride.update(driver_completed: true)

    redirect_to driver_path(@driver)
  end
  
  def rate_as_driver
    @ride = Ride.find(params[:id])
    @driver =  Driver.find_by(uid: session[:current_user_id])
    @rider = @ride.rider

    case params[:karma]
    when "positive"
      old_karma = @rider.karma
      @rider.update(karma: old_karma + 1)
    when "negative"
      old_karma = @driver.karma
      @rider.update(karma: old_karma - 1)
    end
    
    @ride.update(driver_rated: true)
    redirect_to driver_path(@driver)
  end
  
  def complete_as_rider
    @ride = Ride.find(params[:id])
    @rider = Rider.find_by(uid: session[:current_user_id])
    @ride.update(rider_completed: true)

    redirect_to rider_path(@rider)
  end 
  
  def rate_as_rider
    @ride = Ride.find(params[:id])
    @rider = Rider.find_by(uid: session[:current_user_id])
    @driver = @ride.driver
    
    case params[:karma]
    when "positive"
      old_karma = @driver.karma
      @driver.update(karma: old_karma + 1)
    when "negative"
      old_karma = @driver.karma
      @driver.update(karma: old_karma - 1)
    end
    
    @ride.update(rider_rated: true)
    redirect_to rider_path(@rider)
  end
  
  def order_rides
    @riders.each do |rider|
       rider.update(matching_ratio: matching_ratio(rider.num_matching_certifications(@driver.certifications).to_f, rider.num_needs.to_f))
    end
    @riders = @riders.order(matching_ratio: :desc)
  end
  
  def matching_ratio(num_certifications, num_needs)
    if num_needs == 0
      return 1.0
    else
      return  num_certifications / num_needs 
    end
  end
  
  private
  def ride_params
    params.require(:ride).permit(:id, :rider_id, :origin, :destination, :timeAndDate)
  end
end
 