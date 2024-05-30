require 'rails_helper'

RSpec.describe "Tweets", type: :request do
  describe "GET /index" do
    it "redirects to login page" do
      get root_path
      expect(response).to redirect_to(new_user_session_path)
    end
  end

  describe "GET /index" do
    it "returns http success when signed in" do
      sign_in create(:user)
      get root_path
      expect(response).to have_http_status(:success)
    end
  end
end
