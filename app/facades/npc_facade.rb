class NPCFacade
    def self.get_npc
        npc_name = NPCService.get_npc_name[:name]
        npc_ancestry = NPCService.get_npc_ancestry[:name]
        npc_class = NPCService.get_npc_class[:name]
        NPC.new(npc_name, npc_ancestry, npc_class)
    end
end
