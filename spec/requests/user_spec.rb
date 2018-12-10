require 'rails_helper'

RSpec.describe "A user can choose to purchase premium membership", type: :feature do
  let(:existing_user) {
    Fabricate(:user)
  }

  let(:admin) {
    {
      email: 'admin01@gmail.com',
      password: 12345678
    }
  }


  describe "POST /users/:id/purchase_premium" do
    it "purchase premium success" do
      login_as(existing_user)
      visit "/"
      click_button "Purchase"

      expect(page).to have_content "you are now a premium member"
      expect(page).to have_current_path "/"
    end
  end
end
