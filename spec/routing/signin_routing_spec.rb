require "rails_helper"

RSpec.describe Devise::SessionsController, type: :routing do
  describe "routing" do
    it "routes to #create" do
      expect(:post => "/users/sign_in").to route_to("devise/sessions#create")
    end
  end
end
