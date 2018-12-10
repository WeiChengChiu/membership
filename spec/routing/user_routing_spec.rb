require "rails_helper"

RSpec.describe UsersController, type: :routing do
  describe "routing" do
    it "routes to #update_role" do
      expect(:post => "/admin/users/:id/update_role").to route_to("admin/users#update_role", "id" => ":id")
    end
  end
end
