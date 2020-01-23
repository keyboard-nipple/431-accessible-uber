class WelcomeController < ApplicationController
  helper_method :login_as_rider

  # GET /welcome
  def index

  end

  def login_as_rider
    session[:user_type] = "rider"
    redirect_to "/auth/google_oauth2"
  end
end
