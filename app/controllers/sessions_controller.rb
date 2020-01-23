class SessionsController < ApplicationController
  def create
    session[:current_user_id] = auth_hash["uid"]
    
    case session[:user_type]
    when "rider"
      if (Rider.exists?(uid: session[:current_user_id]))
        redirect_to Rider.find_by(uid: session[:current_user_id])
      else
        redirect_to new_rider_path
      end
    end
  end
  
  private
  def auth_hash
    request.env['omniauth.auth']
  end
end
