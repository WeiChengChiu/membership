require 'rails_helper'

RSpec.describe "homes/index", type: :view do
  before(:all) do
    @products = Product.all
  end

  it "can renders with login" do
    current_user = User.find_by(email: "admin01@gmail.com")
    allow(view).to receive(:current_user).and_return(current_user)
    render
    expect(rendered).to include("登出")
    expect(rendered).to include("修改密碼")
  end

  it "can renders with no login" do
    current_user = nil
    allow(view).to receive(:current_user).and_return(current_user)
    render
    expect(rendered).to include("註冊")
    expect(rendered).to include("登入")
  end

  it "A premium member can see products with discount prices" do
    current_user = User.find_by(email: "admin01@gmail.com")
    current_user.update(is_premium: true)
    allow(view).to receive(:current_user).and_return(current_user)
    render
    expect(rendered).to include("登出")
    expect(rendered).to include("修改密碼")
    expect(rendered).to include("Discount Price")
  end
end
