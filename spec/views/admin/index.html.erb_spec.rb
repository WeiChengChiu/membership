require 'rails_helper'

RSpec.describe "admin/products/index", type: :view do
  it "can renders with login" do
    @users = User.all
    current_user = User.find_by(email: "admin01@gmail.com")
    allow(view).to receive(:current_user).and_return(current_user)
    render
    expect(rendered).to include("Admin products list")
  end
end
