class UsersController < ApplicationController
  before_action :require_current_user

  def destroy
    user = User.find(params[:id])
    UserNpcModel.where(user_id: user.id).map do |user_npc_model|
      NpcFacade.destroy_npc(user_npc_model.npc_model_id)
    end
    flash[:success] = "The #{user.name} account has been destroyed!"
    user.destroy
    if !current_user.admin? || params[:id].to_i == current_user.id
      session[:user_id] = nil
      redirect_to root_path
    else
      redirect_back(fallback_location: root_path)
    end
  end
end
