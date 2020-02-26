class RidersController < ApplicationController
  def index
    @riders = Rider.all
  end
  
  def show
    @rider = Rider.find(params[:id])
  end
  
  def new
    @rider = Rider.new
  end
  
  def edit
    @rider = Rider.find(params[:id])
  end
  
  def create
    @rider = Rider.new(rider_params)
    if @rider.save
      redirect_to @rider
    else
      render 'new'
    end
  end
  
  def update
    @rider = Rider.find(params[:id])
    if @rider.update(rider_params)
      redirect_to @rider
    else
      render 'edit'
    end
  end
  
  def destroy
    @rider = Rider.find(params[:id])
    @rider.destroy
    redirect_to "/"
  end

  private
  def rider_params
    params.require(:rider) .permit(:uid, :name, :email, :zip_code, :dob, :deaf, :wheelchair, :service_animal, :blind_accessibility, :emergency_contact)
  end
end