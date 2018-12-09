class Admin::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin

  def update_role
    user = User.find_by(id: params[:id])
    if user && user.role == nil
      user.update(role: 'admin')
      flash[:notice] = "Successfully update #{user.email} to admin"
    else
      flash[:alert] = "user doesn't exists or user can't be set to admin"
    end

    redirect_to admin_products_path
  end
end
