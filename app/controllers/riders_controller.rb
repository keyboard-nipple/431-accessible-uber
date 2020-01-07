class RidersController < ApplicationController
  def index
    @riders = Rider.all
  end
  
  def show
    @rider = Rider.find(params[:id])
  end
  
  def new
    if Rider.exists?(uid: auth_hash["uid"])
      @rider = Rider.find_by(uid: auth_hash["uid"])
      redirect_to @rider
    else
      @rider = Rider.new
      @user_info = auth_hash
    end
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
    redirect_to riders_path
  end
  
  private
  def rider_params
    params.require(:rider) .permit(:uid, :name, :email, :zip_code, :dob)
  end

  def auth_hash
    request.env['omniauth.auth']
  end
end