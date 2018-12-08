require 'rails_helper'

RSpec.describe "homes/index", type: :view do
  it "can renders with login" do
    current_user = User.find_by(email: "test01@gmail.com")
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
end
