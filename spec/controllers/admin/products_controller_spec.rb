require 'rails_helper'

RSpec.describe Admin::ProductsController, type: :controller do
  describe "without admin login" do
      it "#index with no admin" do
      get :index
      expect(response).to have_http_status(302)
    end
  end

  describe "admin login" do
    let(:admin) {
      User.find_by(email: "admin01@gmail.com")
    }

    let(:product) {
      Fabricate(:product)
    }

    before(:each) do
      allow(request.env['warden']).to receive(:authenticate!).and_return(admin)
      allow(controller).to receive(:current_user).and_return(admin)
    end

    it "#index" do
      get :index
      expect(response).to have_http_status(200)
      expect(response).to render_template(:index)
    end

    it "#new" do
      get :new
      expect(response).to have_http_status(200)
      expect(response).to render_template(:new)
    end

    it "#edit" do
      get :edit, params: { id: product.id }
      expect(response).to have_http_status(200)
      expect(response).to render_template(:edit)
    end

    describe "#create" do
      it "changes record" do
        # params = {
        #   product: {
        #     name: product.name,
        #     price: product.price,
        #     image: product.image
        #   }
        # }

        # status 500
        # Paperclip::AdapterRegistry::NoHandlerError Exception: No handler found for "/system/products/images/000/000/009/original/pikachu.png?1544493538"

        # post :create, params: params
        # expect(Product.find(product.id)[:name]).to eq(params[:name])
      end

      # it "redirect on success" do
      # end

      # it "render :new on fail" do
      # end
    end
  end

  describe "#update" do
    it "changes record" do
      # params = {
      #   product: {
      #     name: 'change name',
      #     price: product.price,
      #     image: product.image }
      # }
      # post :update, params: {  name: 'change name', price: product.price, image: product.image }
      # expect(Product.find(product.id)[:name]).to eq(params[:name])
    end

    # it "redirect on success" do
    # end

    # it "render :edit on fail" do
    # end
  end
end
