class CertificationsController < ApplicationController
  def index
    @drivers = Driver.all
  end
  
  def create
    @driver = Driver.find(params[:driver_id])
    @certification = @driver.certifications.create(certification_params)
    redirect_to driver_path(@driver)
  end
  
  def approve
    @certification = Certification.find(params[:id])
    @certification.update(approved: true)
    
    redirect_to "/certifications"
  end
  
  def reject
    @certification = Certification.find(params[:id])
    @certification.update(approved: false)
    
    redirect_to "/certifications"
  end
 
  private
    def certification_params
      params.require(:certification).permit(:id, :image, :name, :disabilities)
    end
end
