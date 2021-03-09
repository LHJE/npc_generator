require 'rails_helper'

RSpec.describe 'NPC Facade' do
  it "It returns npc poro" do
    npc = NPCFacade.get_npc

    expect(npc).to be_a(NPC)
  end
end
