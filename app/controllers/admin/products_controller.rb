class Admin::ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin

  layout 'admin'

  def index
    @users = User.all
  end
end
