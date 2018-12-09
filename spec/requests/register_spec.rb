require 'rails_helper'

RSpec.describe "Register", type: :feature do
  let(:valid_attributes) {
    {
      email: Faker::Internet.email,
      password: Faker::Internet.password
    }
  }

  let(:user) {
    Fabricate(:user)
  }

  describe "POST /users" do
    it "fill_in success" do
      visit "/users/sign_up"
      fill_in "Email", with: valid_attributes[:email]
      fill_in "Password", with: valid_attributes[:password]
      fill_in "Password confirmation", with: valid_attributes[:password]
      click_button "Sign up"

      expect(page).to have_content "Welcome! You have signed up successfully."
      expect(page).to have_current_path "/"
    end

    it "fill_in all blank" do
      visit "/users/sign_up"
      click_button "Sign up"

      expect(page).to have_content "Email can't be blank"
      expect(page).to have_content "Password can't be blank"
      expect(page).to have_current_path "/users"
    end

    it "Email has already been taken" do
      visit "/users/sign_up"
      fill_in "Email", with: user.email
      fill_in "Password", with: user.password
      fill_in "Password confirmation", with: user.password
      click_button "Sign up"

      expect(page).to have_content "Email has already been taken"
      expect(page).to have_current_path "/users"
    end

    it "Email be blank" do
      visit "/users/sign_up"
      fill_in "Password", with: valid_attributes[:password]
      fill_in "Password confirmation", with: valid_attributes[:password]
      click_button "Sign up"

      expect(page).to have_content "Email can't be blank"
      expect(page).to have_current_path "/users"
    end

    it "Password and Password confirmation are blank" do
      visit "/users/sign_up"
      fill_in "Email", with: valid_attributes[:email]
      click_button "Sign up"

      expect(page).to have_content "Password can't be blank"
      expect(page).to have_current_path "/users"
    end

    it "Password be blank" do
      visit "/users/sign_up"
      fill_in "Email", with: valid_attributes[:email]
      fill_in "Password confirmation", with: valid_attributes[:password]
      click_button "Sign up"

      expect(page).to have_content "Password can't be blank"
      expect(page).to have_content "Password confirmation doesn't match Password"
      expect(page).to have_current_path "/users"
    end

    it "Password be blank, and Password confirmation is too short (minimum is 6 characters)" do
      visit "/users/sign_up"
      fill_in "Email", with: valid_attributes[:email]
      fill_in "Password confirmation", with: 123
      click_button "Sign up"

      expect(page).to have_content "Password can't be blank"
      expect(page).to have_content "Password confirmation doesn't match Password"
      expect(page).to have_current_path "/users"
    end

    it "Password confirmation be blank" do
      visit "/users/sign_up"
      fill_in "Email", with: valid_attributes[:email]
      fill_in "Password", with: valid_attributes[:password]
      click_button "Sign up"

      expect(page).to have_content "Password confirmation doesn't match Password"
      expect(page).to have_current_path "/users"
    end

    it "Password confirmation be blank, and Password is too short (minimum is 6 characters)" do
      visit "/users/sign_up"
      fill_in "Email", with: valid_attributes[:email]
      fill_in "Password", with: 123
      click_button "Sign up"

      expect(page).to have_content "Password confirmation doesn't match Password"
      expect(page).to have_content "Password is too short (minimum is 6 characters)"
      expect(page).to have_current_path "/users"
    end
  end
end
