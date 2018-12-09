require 'rails_helper'

RSpec.describe Admin::UsersController, type: :controller do
  let(:admin) {
    User.find_by(email: 'admin01@gmail.com')
  }

  let(:user) {
    Fabricate(:user)
  }

  def admin_login
    allow(request.env['warden']).to receive(:authenticate!).and_return(admin)
    allow(controller).to receive(:current_user).and_return(admin)
  end

  describe "#update_role" do
    it "Changes record" do
      admin_login
      post :update_role, params: { id: user.id }
      expect(User.find(user.id).role).to eq('admin')
    end

    it "Redirect on success" do
      admin_login
      post :update_role, params: { id: user.id }
      expect(response).not_to have_http_status(200)
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(admin_products_path)
    end

    it "Redirect on failed" do
      post :update_role, params: { id: admin.id }
      expect(response).not_to have_http_status(200)
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(new_user_session_path)
    end
  end
end
