require 'faker'
class NPCFacade
  def self.get_npc
    npc_name = [Faker::Games::WarhammerFantasy.hero.split(" ")[0], Faker::Science.scientist.split(" ")[0], Faker::FunnyName.two_word_name.split(" ")[1]]
    npc_ancestry = NPCService.get_npc_ancestry[:name]
    npc_class = NPCService.get_npc_class[:name]
    NPC.new(npc_name, npc_ancestry, npc_class)
  end
end
