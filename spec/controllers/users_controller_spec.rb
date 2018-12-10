require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user) {
    Fabricate(:user)
  }

  def user_login
    allow(request.env['warden']).to receive(:authenticate!).and_return(user)
    allow(controller).to receive(:current_user).and_return(user)
  end

  describe "#purchase_premium" do
    it "Changes is_premium to true" do
      user_login
      post :purchase_premium, params: { id: user.id }
      expect(User.find(user.id).is_premium).to eq(true)
    end

    it "Redirect on success" do
      user_login
      post :purchase_premium, params: { id: user.id }
      expect(response).not_to have_http_status(200)
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(root_path)
    end

    it "Redirect on failed" do
      post :purchase_premium, params: { id: user.id }
      expect(response).not_to have_http_status(200)
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(new_user_session_path)
    end
  end
end
