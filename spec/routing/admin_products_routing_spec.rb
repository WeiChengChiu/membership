require "rails_helper"

RSpec.describe Admin::ProductsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/admin/products").to route_to("admin/products#index")
    end

    it "routes to #new" do
      expect(:get => "/admin/products/new").to route_to("admin/products#new")
    end

    it "routes to #create" do
      expect(:post => "/admin/products").to route_to("admin/products#create")
    end

    it "routes to #edit" do
      expect(:get => "/admin/products/:id/edit").to route_to("admin/products#edit", "id" => ":id")
    end

    it "routes to #update" do
      expect(:put => "/admin/products/:id").to route_to("admin/products#update", "id" => ":id")
    end
  end
end
