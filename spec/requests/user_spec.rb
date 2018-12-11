require 'rails_helper'

RSpec.describe "A user can choose to purchase premium membership", type: :feature do
  let(:user) {
    Fabricate(:user)
  }

  describe "POST /users/:id/purchase_premium" do
    it "purchase premium success" do
      login_as(user)
      visit root_path
      click_button "Purchase"

      expect(page).to have_content "you are now a premium member"
      expect(page).to have_current_path root_path
    end
  end
end
