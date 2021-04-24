class NpcModelsController < ApplicationController
  helper_method :require_current_user,
                :check_if_saving_npc

  def new
    if current_user.admin?
      redirect_to '/admin/dashboard'
    else
      redirect_to '/user/dashboard'
    end
  end

  def show
    @npc = NpcModel.where(id: params[:id])[0]
  end

  def destroy
    NpcModel.where(id: params[:id]).destroy_all
    redirect_back(fallback_location: root_path)
  end
end
