class Admin::ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin

  layout 'admin'

  def index
  end

  protected
    def check_admin
        unless current_user.admin?
            raise ActiveRecord::RecordNotFound
            return
        end
    end
end
