class UsersController < ApplicationController
  before_action :require_current_user

  def destroy
    if !current_user.admin?
      user = User.find(current_user.id)
      session[:user_id] = nil
    else
      user = User.find(params[:id])
    end
    UserFacade.destroy_user_relations(user)
    flash[:success] = "The #{user.name} account has been destroyed!"
    user.destroy
    if !current_user.admin?
      redirect_to root_path
    else
      redirect_back(fallback_location: root_path)
    end
  end
end
