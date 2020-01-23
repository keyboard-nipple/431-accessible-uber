require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  before(:each) do
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
    :provider => 'google_oauth2',
    :uid => 123
    })
    
    request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2]
  end
  
  describe "session#create" do
    it "should assign the user id to the session hash" do
      get :create
      expect(session[:current_user_id]).to eq(123)
    end
    
    it "should redirect to riders#new if session is of type rider" do
      session[:user_type] = "rider"
      get :create
      expect(response).to redirect_to "/riders/new"
    end
  end
end
