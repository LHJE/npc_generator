class WelcomeController < ApplicationController
  def index
    NpcModel.where(is_saved: 0).ids.map do |id|
      NpcModelArmor.where(npc_model_id: id).destroy_all
      NpcModelPack.where(npc_model_id: id).destroy_all
      NpcModelWeapon.where(npc_model_id: id).destroy_all
      NpcModelSpell.where(npc_model_id: id).destroy_all
    end
    NpcModel.where(is_saved: 0).destroy_all

    unless params[:post].nil?
      base_info = NPCFacade.create_npc(params[:post][:score_type].downcase, params[:post][:level].to_i)
      @npc = base_info[0]
      @pack = base_info[1]
      @armor = base_info[2]
      @weapons = base_info[3]
      @spells = base_info[4]
    end
  end
end
