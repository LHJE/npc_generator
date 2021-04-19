class UserFacade
  def self.destroy_user_relations(user)
    UserNpcModel.where(user_id: user.id).map do |user_npc_model|
      NpcModel.where(id: user_npc_model.npc_model_id).ids.map do |id|
        NpcModelArmor.where(npc_model_id: id).destroy_all
        NpcModelPack.where(npc_model_id: id).destroy_all
        NpcModelWeapon.where(npc_model_id: id).destroy_all
        NpcModelSpell.where(npc_model_id: id).destroy_all
        UserNpcModel.where(npc_model_id: id).destroy_all
      end
      NpcModel.where(id: user_npc_model.npc_model_id).destroy_all
    end
  end
end
