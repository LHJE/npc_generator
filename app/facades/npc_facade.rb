require 'faker'
class NPCFacade
  def self.create_npc
    npc_ancestry = NPCService.create_npc_ancestry
    npc_background = NPCService.create_npc_background
    npc_class = NPCService.create_npc_class
    NPC.new(npc_ancestry, npc_background, npc_class)
  end
end
