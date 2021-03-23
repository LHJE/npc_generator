require 'faker'
class NPCFacade
  def self.create_npc(score_type, level)
    npc_ancestry = NPCService.create_npc_ancestry
    npc_class = NPCService.create_npc_class
    NPC.new(npc_ancestry, npc_class, score_type, level)
  end
end
