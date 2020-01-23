require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do
  before(:each) do
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
    :provider => 'google_oauth2',
    })
  end
  
  describe "login_as_rider" do
    # it "should set session[user_type] to rider" do
    #   controller.login_as_rider()
    #   expect(session[:user_type]).to eq("rider")
    # end
  end
end
