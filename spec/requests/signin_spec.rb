require 'rails_helper'

RSpec.describe "Sign in", type: :feature do
  let(:existing_user) {
    Fabricate(:user)
  }

  let(:admin) {
    {
      email: 'test01@gmail.com',
      password: 12345678
    }
  }

  describe "POST /users/sign_in" do
    it "normal user sign_in" do
      visit "/users/sign_in"
      fill_in "Email", with: existing_user.email
      fill_in "Password", with: existing_user.password
      click_button "Log in"

      expect(page).to have_content "Signed in successfully."
      expect(page).to have_current_path "/"
    end

    it "admin sign_in" do
      visit "/users/sign_in"
      fill_in "Email", with: admin[:email]
      fill_in "Password", with: admin[:password]
      click_button "Log in"
      expect(page).to have_content "Signed in successfully."
      expect(page).to have_content "admin"
      expect(page).to have_current_path "/"
    end

    it "fill_in all blank" do
      visit "/users/sign_in"
      click_button "Log in"

      expect(page).to have_content "Invalid Email or password."
      expect(page).to have_current_path "/users/sign_in"
    end

    it "Email be blank" do
      visit "/users/sign_in"
      fill_in "Password", with: existing_user.password
      click_button "Log in"

      expect(page).to have_content "Invalid Email or password."
      expect(page).to have_current_path "/users/sign_in"
    end

    it "Invalid Email" do
      visit "/users/sign_in"
      fill_in "Email", with: 'error@emailerrorerror'
      fill_in "Password", with: existing_user.password
      click_button "Log in"

      expect(page).to have_content "Invalid Email or password."
      expect(page).to have_current_path "/users/sign_in"
    end

    it "Password be blank" do
      visit "/users/sign_in"
      fill_in "Email", with: existing_user.email
      click_button "Log in"

      expect(page).to have_content "Invalid Email or password."
      expect(page).to have_current_path "/users/sign_in"
    end

    it "Invalid Password" do
      visit "/users/sign_in"
      fill_in "Email", with: existing_user.email
      fill_in "Password", with: existing_user.email
      click_button "Log in"

      expect(page).to have_content "Invalid Email or password."
      expect(page).to have_current_path "/users/sign_in"
    end
  end
end
