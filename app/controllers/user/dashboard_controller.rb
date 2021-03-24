class User::DashboardController < ApplicationController
  before_action :require_current_user
  def show
    NpcModel.where(is_saved: 0).ids.map do |id|
      NpcModelArmor.where(npc_model_id: id).destroy_all
      NpcModelPack.where(npc_model_id: id).destroy_all
      NpcModelWeapon.where(npc_model_id: id).destroy_all
      NpcModelSpell.where(npc_model_id: id).destroy_all
    end
    NpcModel.where(is_saved: 0).destroy_all
    @npcs = UserNpcModel.where(user_id: current_user.id).map do |user_npc_model|
      NpcModel.where(id: user_npc_model.npc_model_id)
    end.flatten
  end
end
