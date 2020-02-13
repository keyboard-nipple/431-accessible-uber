class CertificationsController < ApplicationController
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
