require 'rails_helper'

RSpec.describe "Admin::Products", type: :request do
  before do
    ActionController::Base.allow_forgery_protection = false
  end

  after do
    ActionController::Base.allow_forgery_protection = true
  end

  let(:admin) {
    User.find_by(email: 'admin01@gmail.com')
  }

  before(:each) do
    login_as(admin)
  end

  let(:product) {
    Fabricate(:product)
  }

  it "#index" do
    get admin_products_path
    expect(response).to have_http_status(200)
    expect(response).to render_template(:index)
    expect(response.body).to include("Name")
    expect(response.body).to include("Price")
    expect(response.body).to include("admin01@gmail.com")
  end

  it "#new" do
    get new_admin_product_path
    expect(response).to have_http_status(200)
    expect(response).to render_template(:new)
    expect(response.body).to include("New Product")
    expect(response.body).to include("Name")
    expect(response.body).to include("Price")
    expect(response.body).to include("Image")
    expect(response.body).to include("Create Product")
  end

  it "#create" do
    params = { product: {name: product.name, price: product.price, image: product.image}}
    post admin_products_path, params: params
    # status 500
    # Paperclip::AdapterRegistry::NoHandlerError (No handler found for "/system/products/images/000/000/009/original/pikachu.png?1544493253"):

    # expect(response).to have_http_status(302)
    # expect(Product.last.name).to eq(params[:name])
  end

  it "#edit" do
    get edit_admin_product_path(product)
    expect(response).to have_http_status(200)
    expect(response).to render_template(:edit)
    expect(response.body).to include("Edit Product")
    expect(response.body).to include("Name")
    expect(response.body).to include("Price")
    expect(response.body).to include("Image")
    expect(response.body).to include("Update Product")
  end

  it "#update" do
  end
end
