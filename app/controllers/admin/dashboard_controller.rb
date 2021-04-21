class Admin::DashboardController < ApplicationController
  before_action :require_current_user,
                :require_admin,
                :check_if_saving_npc

  def show
    @npcs = UserNpcModel.where(user_id: current_user.id).map do |user_npc_model|
      NpcModel.where(id: user_npc_model.npc_model_id)
    end.flatten
  end
end
