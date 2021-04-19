class User::DashboardController < ApplicationController
  before_action :require_current_user,
                :exclude_admin

  def show
    @npcs = UserNpcModel.where(user_id: current_user.id).map do |user_npc_model|
      NpcModel.where(id: user_npc_model.npc_model_id)
    end.flatten
  end
end
