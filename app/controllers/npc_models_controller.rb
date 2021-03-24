class NpcModelsController < ApplicationController
  helper_method :require_current_user

  def new
    UserNpcModel.create!(npc_model_id: params[:id], user_id: current_user.id)
    NpcModel.where(id: params[:id])[0].update(is_saved: 1)
    redirect_to '/user/dashboard'
  end

  def show
    @npc = NpcModel.where(id: params[:id])[0]
    @armor = NpcModelArmor.where(npc_model_id: @npc.id).map do |npc_model_armor|
      Armor.where(id: npc_model_armor.armor_id)
    end.flatten
    @pack = NpcModelPack.where(npc_model_id: @npc.id).map do |npc_model_pack|
      Pack.where(id: npc_model_pack.pack_id)
    end
    @weapons = NpcModelWeapon.where(npc_model_id: @npc.id).map do |npc_model_weapon|
      Weapon.where(id: npc_model_weapon.weapon_id)
    end.flatten
    @spells = NpcModelSpell.where(npc_model_id: @npc.id).map do |npc_model_spell|
      Spell.where(id: npc_model_spell.spell_id)
    end.flatten
  end
end
