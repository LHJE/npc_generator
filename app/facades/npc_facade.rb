require 'faker'
class NPCFacade
  def self.create_npc
    npc_ancestry = NPCService.create_npc_ancestry[:name]
    npc_class = NPCService.create_npc_class[:name]
    NPC.new(npc_ancestry, npc_class)
  end
end
