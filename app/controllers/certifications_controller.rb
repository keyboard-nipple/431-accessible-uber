class CertificationsController < ApplicationController
  def index
    @drivers = Driver.all
    @certifications = []
    
    @drivers.each do |driver|
      driver.certifications.each do |certification|
        @certifications.push(certification)
      end
    end
  end
  
  def create
    @driver = Driver.find(params[:driver_id])
    @certification = @driver.certifications.create(certification_params)
    redirect_to driver_path(@driver)
  end
 
  private
    def certification_params
      params.require(:certification).permit(:name, :image)
    end
end
