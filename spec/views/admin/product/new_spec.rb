require 'rails_helper'

RSpec.describe "admin/products/new.html.erb", type: :view do
  before(:each) do
    @product = Product.new
    current_user = User.find_by(email: "admin01@gmail.com")
    allow(view).to receive(:current_user).and_return(current_user)
  end

  it "render partial" do
    render
    expect(response).to render_template(partial: "_form")
  end

  it "has link" do
    render
    expect(rendered).to include("Back")
    expect(rendered).to include("Create Product")
  end
end
