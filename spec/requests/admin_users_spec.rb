require 'rails_helper'

RSpec.describe "Change normal user role to admin", type: :feature do
  let(:admin) {
    User.find_by(email: 'admin01@gmail.com')
  }

  before(:each) do
    login_as(admin)
  end

  describe "POST /admin/users/:id/update_role" do
    it "update to premium membership success" do
      visit "/admin/products"
      click_button "Change"

      expect(page).to have_content "Successfully update"
      expect(page).to have_current_path "/admin/products"
    end
  end
end
