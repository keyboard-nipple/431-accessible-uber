class AdminsController < ApplicationController
  def index
    @admins = Admin.all
  end
  
  def show
    @admin = Admin.find(params[:id])
  end

  def destroy
    @admin = Admin.find(params[:id])
    @admin.destroy
    redirect_to "/"
  end
  
  def approve_certifications
    
  end
end
