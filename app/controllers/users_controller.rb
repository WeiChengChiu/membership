class UsersController < ApplicationController
  before_action :authenticate_user!

  def purchase_premium
    if current_user.is_premium
      flash[:alret] = 'you are already a premium member'
      return redirect_to root_path
    end

    if current_user.update(is_premium: true)
      flash[:notice] = 'you are now a premium member'
    else
      flash[:alret] = 'failed update to a premium member'
    end

    redirect_to root_path
  end
end
