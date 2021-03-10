require 'rails_helper'

RSpec.describe 'NPC Facade' do
  it "It returns npc poro" do
    npc = NPCFacade.create_npc

    expect(npc).to be_a(NPC)
    expect(npc.name).to be_a(String)
    expect(npc.class).to be_a(String)
    expect(npc.ancestry).to be_a(String)
  end
end
