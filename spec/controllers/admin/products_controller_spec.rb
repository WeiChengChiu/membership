require 'rails_helper'

RSpec.describe Admin::ProductsController, type: :controller do
  it "GET #index with admin" do
    user = User.find_by(email: "test01@gmail.com")
    allow(request.env['warden']).to receive(:authenticate!).and_return(user)
    allow(controller).to receive(:current_user).and_return(user)
    get :index
    expect(response).to have_http_status(200)
    expect(response).to render_template(:index)
  end

  it "GET #index with no admin" do
    get :index
    expect(response).to have_http_status(302)
  end
end
