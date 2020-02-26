class SessionsController < ApplicationController
  def create
    session[:current_user_id] = auth_hash["uid"]
    session[:user_name] = auth_hash["info"]["name"]
    session[:user_email] = auth_hash["info"]["email"]
    
    case session[:user_type]
    when "rider"
      if (Rider.exists?(uid: session[:current_user_id]))
        redirect_to Rider.find_by(uid: session[:current_user_id])
      else
        redirect_to new_rider_path
      end
    when "driver"
      if (Driver.exists?(uid: session[:current_user_id]))
        redirect_to Driver.find_by(uid: session[:current_user_id])
      else
        redirect_to new_driver_path
      end
    when "admin"
      if (Admin.exists?(uid: session[:current_user_id]))
        redirect_to Admin.find_by(uid: session[:current_user_id])
      else
        new_admin = Admin.new(name: session[:user_name], uid: session[:current_user_id])
        new_admin.save
        redirect_to new_admin
      end
    end
  end
  
  private
  def auth_hash
    request.env['omniauth.auth']
  end
end
