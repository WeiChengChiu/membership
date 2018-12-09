class ApplicationController < ActionController::Base
  protected

  def check_admin
    unless current_user.admin?
      raise ActiveRecord::RecordNotFound
      return
    end
  end
end
